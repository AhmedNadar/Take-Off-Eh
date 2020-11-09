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
FactoryBot.define do
  factory :event do
    # name { "MyString" }
    # date.datetime { "MyString" }
    # location { "MyString" }
    # user { nil }
    # category { "MyString" }
  end
end
