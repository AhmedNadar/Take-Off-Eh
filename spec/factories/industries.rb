# == Schema Information
#
# Table name: industries
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :industry do
    name { "MyString" }
  end
end
