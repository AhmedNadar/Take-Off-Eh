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
#  industry       :string
#  name           :string
#  phone_number   :string
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
require 'rails_helper'

RSpec.describe Company, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
