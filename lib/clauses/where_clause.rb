require 'clauses/base_clause'
require 'clauses/where_clause/values_extractor'

module RelationChecking
  module Clauses
    class WhereClause < BaseClause
      def initialize(conditions = {})
        @conditions = conditions
      end

      def check_against(relation)
        values = ValuesExtractor.new(relation.where_values).to_h
        @conditions.all? { |k, v| values[k.to_s] == v }
      end
    end
  end
end
