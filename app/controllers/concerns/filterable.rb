module Filterable
  extend ActiveSupport::Concern

  LIKE_FIELDS = ['email', 'first_name', 'last_name']
  EQUAL_FIELDS = ['is_active']

  module ClassMethods
    def filter(filtering_params)
      query = []
      # results = self.where(nil)
      filtering_params.each do |key, value|
        case key
        when *LIKE_FIELDS
          query.push sanitize_sql_array ["#{key} ilike ?", value] if value.present?
        when *EQUAL_FIELDS
          query.push sanitize_sql_array ["#{key} = ?", value] if value.present?
        end
      end
      return self.where(query.join(' and '))
    end
  end
end