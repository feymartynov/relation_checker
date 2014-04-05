require 'clauses/base_clause'

module RelationChecking
  module Clauses
    class OrderClause < BaseClause
      def initialize(*values)
        @order_values = {}

        values.map do |value|
          if value.is_a?(Hash)
            @order_values.merge!(value)
          else
            @order_values[value] = :asc
          end
        end
      end

      def check_against(relation)
        results = @order_values.map do |field, direction|
          search = "\"#{relation.klass.table_name}\".#{field} #{direction.to_s.upcase}"
          relation.arel.orders.find_index { |v| v == search }
        end

        results.none?(&:nil?) && results.sort == results
      end
    end
  end
end
