# frozen_string_literal: true
#
# Sluggable concern for generate slugs across models
#
module Sluggable
  extend ActiveSupport::Concern

  included do
    extend FriendlyId

    friendly_id :slug_candidates, use: %i[slugged history]

    validates :suggested_url, allow_blank: true, uniqueness: { 
      case_sensitive: false,
      message: 'is already taken, leave blank to generate automatically'
    }

    # Define our slug candidates for FriendlyId
    #
    # @return [array]
    #
    def slug_candidates
      [
        :suggested_url,
        :name
      ]
    end

    # Determine whether a new slug should be generated depending on the fields
    # that have been changed
    #
    # @return [boolean]
    #
    def should_generate_new_friendly_id?
      !slug? || will_save_change_to_suggested_url? || 
      will_save_change_to_name?
    end
  end
end