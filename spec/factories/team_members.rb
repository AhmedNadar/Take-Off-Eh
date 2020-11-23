# == Schema Information
#
# Table name: team_members
#
#  id           :bigint           not null, primary key
#  email        :string
#  first_name   :string
#  last_name    :string
#  note         :string
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
FactoryBot.define do
  factory :team_member do
    user { nil }
    company { nil }
    title { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    profile_link { "MyString" }
    email { "MyString" }
  end
end
