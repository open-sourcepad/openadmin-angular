module Filterable
  extend ActiveSupport::Concern

  LIKE_FIELDS = ["email", "first_name", "last_name"]
  EQUAL_FIELDS = ["is_active"]

  module ClassMethods
    def filter(params)
      query = []

      params.each do |key, value|
        case key
        when *LIKE_FIELDS
          query.push sanitize_sql_array ["#{key} ilike ?", "%#{value}%"] if !value.blank?
        when *EQUAL_FIELDS
          query.push sanitize_sql_array ["#{key} = ?", value] if !value.blank?
        end
      end
      query.join(" and ")
    end
  end
end
