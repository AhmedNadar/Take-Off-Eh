# == Schema Information
#
# Table name: jobs
#
#  id                :bigint           not null, primary key
#  category          :string
#  company_statement :string
#  featured          :boolean          default(FALSE)
#  featured_until    :datetime
#  job_type          :string
#  link_to_apply     :string
#  price             :integer
#  published_at      :datetime
#  region            :string
#  remote            :boolean          default(FALSE)
#  slug              :string           indexed
#  status            :string           default("pending")
#  suggested_url     :string
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  company_id        :bigint           not null, indexed
#  user_id           :bigint           not null, indexed
#
# Indexes
#
#  index_jobs_on_company_id  (company_id)
#  index_jobs_on_slug        (slug) UNIQUE
#  index_jobs_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#
class Job < ApplicationRecord
  has_paper_trail
  # include SluggableJob  
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  #association
  belongs_to        :company, dependent: :destroy
  belongs_to        :user, dependent: :destroy
  has_rich_text     :description
  
  #validation
  validates :title,
            :description,
            :job_type,
            :link_to_apply,
            :region,
            :category,
            presence: true

  # scopes
  scope :desc, -> { order(created_at: :desc) }
  scope :pending, -> { where(status: JOB_STATUSES[:pending]) }
  scope :published, -> { where(status: JOB_STATUSES[:published]) }
  scope :archived, -> { where(status: JOB_STATUSES[:archived]) }

  #constants

  #https://stackoverflow.com/questions/1956191/ruby-on-rails-drop-down-menu

  JOB_TYPES = ["Full-time", "Part-time", "Contract", "Freelance"]

  JOB_CATEGORY = ["Design", "Programming", "Customer Support", "Copywriting", "DevOps and Sysadmin", "Sales and Marketing", "Business, Management and Finance", "Product", "Other Category"]
  
  JOB_REGION = ["Anywhere (100% Remote) Only", "Toronto Down Town", "North York", "York", "East York", "Scraborough", "Etobicoke"]

  JOB_STATUSES = {
    pending: "pending",
    published: "published",
    archived: "archived"
  }.freeze

  validates :job_type, inclusion: JOB_TYPES
  validates :category, inclusion: JOB_CATEGORY
  validates :region, inclusion: JOB_REGION

  def slug_candidates
    [:title, [:title, :company_id]]
  end
  
  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end
  

  def pending?
    self.status == Job::JOB_STATUSES[:pending]
  end

  def published?
    self.status == Job::JOB_STATUSES[:published]
  end

  def archived?
    self.status == Job::JOB_STATUSES[:archived]
  end
end
