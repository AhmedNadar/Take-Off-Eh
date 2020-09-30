class TeamMember < ApplicationRecord
  # belongs_to :user, optional: true
  belongs_to :company, optional: true
  has_one_attached :member_photo

  validates :title, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_link, presence: true
  validates :email, presence: true
  validates :member_photo, presence: true
end
