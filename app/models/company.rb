# == Schema Information
#
# Table name: companies
#
#  id             :bigint           not null, primary key
#  business_model :string
#  company_size   :integer
#  email          :string
#  found_date     :string
#  headquarter    :string
#  industry       :string
#  name           :string
#  phone_number   :string
#  slug           :string           indexed
#  stage          :string
#  suggested_url  :string
#  website        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint           not null, indexed
#
# Indexes
#
#  index_companies_on_slug     (slug) UNIQUE
#  index_companies_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Company < ApplicationRecord
  has_paper_trail
  
  # include Sluggable
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  belongs_to :user
  has_rich_text :details
  has_one_attached :company_logo, dependent: :destroy
  has_many_attached :company_images, dependent: :destroy
  has_many :team_members, dependent: :destroy, inverse_of: :company
  has_many :jobs, dependent: :destroy

  accepts_nested_attributes_for :team_members, allow_destroy: true, reject_if: proc { |attr| attr['title'].blank?}

  # validatation
  validates :name,          presence: true
  validates_length_of :name, maximum: 80,   allow_blank: false
  validates :details,       presence: true
  validates :email,         presence: true
  validates :website,       presence: true
  validates :found_date,    presence: true
  # validates :company_logo,  presence: true
  # validates :company_images,  presence: true
  validate :company_logo_format
  validate :image_type
  validates_associated :team_members
  
  # Note that implicit association has a plural form in this case
  scope :with_eager_loaded_images, -> { eager_load(images_attachments: :blob) }

  # Defind company's gallery images size
  def thumbnail input
    return self.company_images[input].variant(resize: '100x100%').processed
  end
  # Defind company logo size
  def logo_resize
    return self.company_logo.variant(resize: '100x100%').processed
  end

  def slug_candidates
    [:name]
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
  
  private

    def company_logo_format
      return unless company_logo.attached?
      return if company_logo.blob.content_type.start_with? 'image/'
      company_logo.purge_later
      errors.add(:company_logo, 'needs to be an image')
    end
  
    def image_type
      if company_images.attached? == false
        errors.add(:company_images, "are missing!")
      end
      company_images.each do |image| 
        if !image.content_type.in?(%('image/jpeg image/png'))
           errors.add(:company_images, "should only be a JPEG and PNG format.")
        end
      end
    end

end
