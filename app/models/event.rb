# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  category   :string
#  date       :datetime
#  location   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null, indexed
#
# Indexes
#
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Event < ApplicationRecord
  belongs_to :user

  has_rich_text :details

  validates :name, presence: true, length: {maximum: 50}
  validates :details, presence: true
  validates :category, presence: true
  validates :date, presence: true
  validates :location, presence: true
  
  after_validation :normalize_name

  # scopes
  scope :desc, ->  { order(created_at: :desc) }
  scope :date, ->  { order(date: :asc) }

  def Event.upcoming
    Event.all.where("date > ?", Time.now)
  end

  def Event.past
    Event.all.where("date < ?", Time.now)
  end

  #constants
  EVENT_CATEGORY = ["Business", "Product", "Startups", "Marketing", "Design", "Social Media", "Cloud", "Programming", "Legal", "Networking", "Mobile"].freeze
  validates :category, inclusion: EVENT_CATEGORY

  private
    def normalize_name
      self.name = name.downcase.titleize
    end
end
