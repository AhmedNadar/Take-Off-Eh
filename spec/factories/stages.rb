# == Schema Information
#
# Table name: stages
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :stage do
    name { "MyString" }
  end
end
