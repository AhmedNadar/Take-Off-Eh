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
#  name           :string
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
FactoryBot.define do
  factory :company do
    name { "MyString" }
    details { nil }
    email { "MyString" }
    website { "MyString" }
    found_date { "2020-09-17" }
    user { nil }
  end
end
