# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  card_brand             :string
#  card_exp_month         :string
#  card_exp_year          :string
#  card_last4             :string
#  email                  :string           default(""), not null, indexed
#  encrypted_password     :string           default(""), not null
#  expires_at             :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string           indexed
#  slug                   :string           indexed
#  suggested_url          :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  stripe_id              :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#
class User < ApplicationRecord  
  rolify

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  has_paper_trail

  # extend FriendlyId
  # friendly_id :name, use: :slugged

  before_save :downcase_email
  before_save :format_name
  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # association
  has_person_name    
  has_one_attached  :picture
  has_many :companies, dependent: :destroy
  has_many :jobs, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :team_members, dependent: :destroy
  
  # validation
  validates :first_name,  presence: true, length: { maximum: 20 }
  validates :last_name,   presence: true, length: { maximum: 20 }
  validates :name,        presence: true, length: { maximum: 20 }  
  validates :email,       presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }  
  validates_format_of :email,:with => Devise::email_regexp

  def admin?
    has_role?(:admin)
  end

  def client?
    has_role?(:client)
  end

  def slug_candidates
    [:name, [:name, :last_name]]
  end

  def should_generate_new_friendly_id?
    if !slug?
      email_changed?
    else
      false
    end
  end

  #Returns user's upcoming events
  def upcoming_events
    events.where("date > ?", Time.now)
  end

  #Returns user's past events
  def past_events
    events.where("date < ?", Time.now)
  end

  private     
    # def should_generate_new_friendly_id?
    #   name_changed? && name.present?    
    # end

    def downcase_email
      self.email = email.downcase
    end  

    def assign_default_role
      self.add_role(:client) if self.roles.blank?
    end

    def format_name
      if name
        name_array = []
        name.split.each do |name_part|
          name_array << name_part.capitalize
        end

        self.name = name_array.join(" ")
      end
    end
end
