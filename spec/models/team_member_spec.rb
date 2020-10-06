# == Schema Information
#
# Table name: team_members
#
#  id           :bigint           not null, primary key
#  email        :string
#  first_name   :string
#  last_name    :string
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
require 'rails_helper'

RSpec.describe TeamMember, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
