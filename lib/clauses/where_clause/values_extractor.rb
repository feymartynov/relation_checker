require 'clauses/base_clause'
require 'clauses/where_clause/values_extractor/value_adapter'

module RelationChecking
  module Clauses
    class WhereClause < BaseClause
      class ValuesExtractor
        def initialize(values)
          @adapters ||= values.map { |v| ValueAdapter.new(v) }
        end

        def to_h
          Hash[@adapters.map { |v| [v.left_value, v.right_value] }]
        end
      end
    end
  end
end
