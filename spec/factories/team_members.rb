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
