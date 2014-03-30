require 'relation_checker/clause'
require 'relation_checker/clauses/where_clause/values_extractor'

module RelationChecking
  class RelationChecker
    class WhereClause < RelationChecking::RelationChecker::Clause
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
