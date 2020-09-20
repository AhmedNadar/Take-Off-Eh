# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  email      :string
#  found_date :date
#  name       :string
#  slug       :string           indexed
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null, indexed
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
  rolify
  # resourcify
  extend FriendlyId

  friendly_id :slug_candidates, use: [:slugged, :finders]

  belongs_to :user, dependent: :destroy
  has_rich_text :details
  has_one_attached :company_logo

    # validatation
  validates :name,          presence: true
  validates_length_of :name, maximum: 80,   allow_blank: false
  validates :details,       presence: true
  validates :email,         presence: true
  validates :website,       presence: true
  validates :found_date,    presence: true
  validates :company_logo,  presence: true


  def slug_candidates
    [:name]
  end

  def should_generate_new_friendly_id?
    if !slug?
      name_changed?
    else
      false
    end
  end

end
