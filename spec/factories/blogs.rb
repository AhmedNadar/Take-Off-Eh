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
FactoryBot.define do
  factory :blog do
    title { "MyString" }
    user { nil }
  end
end
