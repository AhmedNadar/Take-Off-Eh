# == Schema Information
#
# Table name: team_members
#
#  id           :bigint           not null, primary key
#  email        :string
#  first_name   :string
#  last_name    :string
#  profile_link :string
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  company_id   :bigint           not null, indexed
#
# Indexes
#
#  index_team_members_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
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
