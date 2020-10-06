# == Schema Information
#
# Table name: jobs
#
#  id                :bigint           not null, primary key
#  category          :string
#  company_statement :string
#  featured          :boolean          default(FALSE)
#  featured_until    :datetime
#  job_type          :string
#  link_to_apply     :string
#  price             :integer
#  published_at      :datetime
#  region            :string
#  remote            :boolean          default(FALSE)
#  slug              :string           indexed
#  status            :string           default("pending")
#  suggested_url     :string
#  title             :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  company_id        :bigint           not null, indexed
#  user_id           :bigint           not null, indexed
#
# Indexes
#
#  index_jobs_on_company_id  (company_id)
#  index_jobs_on_slug        (slug) UNIQUE
#  index_jobs_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Job, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
