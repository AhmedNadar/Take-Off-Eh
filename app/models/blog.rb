# == Schema Information
#
# Table name: blogs
#
#  id         :bigint           not null, primary key
#  category   :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null, indexed
#
# Indexes
#
#  index_blogs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Blog < ApplicationRecord
  belongs_to :user, optional: true

  has_rich_text :content
  has_one_attached :image, dependent: :destroy

  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true
  validates :category, presence: true
  validate :image_format
  validate :image_presence

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end


  #constants
  BLOG_CATEGORY = ["Business", "Product", "Startups", "Marketing", "Design", "Social Media", "Cloud", "Programming", "Legal", "Networking", "Mobile"].freeze
  validates :category, inclusion: BLOG_CATEGORY
  
  private

    def image_format
      return unless image.attached?
      return if image.blob.content_type.start_with? 'image/'
      image.purge_later
      errors.add(:image, 'needs to be an image')
    end
end
