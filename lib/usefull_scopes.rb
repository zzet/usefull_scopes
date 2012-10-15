module UsefullScopes
  autoload :Version, 'usefull_scopes/version'
  extend ActiveSupport::Concern

  included do
    scope :random, order("RANDOM()")
    scope :exclude, ->(collection_or_object) {
      collection = Array(collection_or_object)
      values = collection.map do |id_or_object|
        find_object_value_or_value(id_or_object)
      end
      return scoped unless values.any?
      where("#{quoted_table_name}.id not in (?)", values)
    }

    attribute_names.each do |a|
      scope "by_#{a}", order("#{quoted_table_name}.#{a} DESC")
      scope "asc_by_#{a}", order("#{quoted_table_name}.#{a} ASC")
      scope "like_by_#{a}", ->(term) {
        quoted_term = connection.quote(term + '%')
        where("lower(#{quoted_table_name}.#{a}) like #{quoted_term}")
      }
      scope "ilike_by_#{a}", ->(term) {
        quoted_term = connection.quote(term + '%')
        where("#{quoted_table_name}.#{a} ilike #{quoted_term}")
      }
      scope "#{a}_more", ->(value_or_object) {
        value = find_object_value_or_value(value_or_object, a)
        where("#{quoted_table_name}.#{a} > #{value}")
      }
      scope "#{a}_less", ->(value_or_object) {
        value = find_object_value_or_value(value_or_object, a)
        where("#{quoted_table_name}.#{a} < #{value}")
      }
      scope "#{a}_more_or_equal", ->(value_or_object) {
        value = find_object_value_or_value(value_or_object, a)
        where("#{quoted_table_name}.#{a} >= #{value}")
      }
      scope "#{a}_less_or_equal", ->(value_or_object) {
        value = find_object_value_or_value(value_or_object, a)
        where("#{quoted_table_name}.#{a} <= #{value}")
      }
    end
    def find_object_value_or_value(value_or_object, field = "id")
      value_or_object.is_a?(ActiveRecord::Base) ? value_or_object.send(field) : value_or_object
    end
  end
end

