# == Schema Information
#
# Table name: industries
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Industry < ApplicationRecord
  has_and_belongs_to_many :companies, dependent: :destroy
end
