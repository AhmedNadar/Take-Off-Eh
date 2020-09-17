# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null, indexed
#  encrypted_password     :string           default(""), not null
#  first_name             :string(255)
#  last_name              :string(255)
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string           indexed
#  slug                   :string           indexed
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_slug                  (slug) UNIQUE
#
class User < ApplicationRecord
  rolify
  has_paper_trail

  extend FriendlyId
  friendly_id :name, use: :slugged

  before_save :downcase_email
  before_save :format_name
  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # association
  has_person_name    
  has_one_attached  :picture
  
  # validation
  validates :name, presence: true, length: {maximum: 20}
  validates_format_of :email,:with => Devise::email_regexp
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }  

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

  def admin?
    has_role?(:admin)
  end

  def client?
		has_role?(:client)
  end

end
