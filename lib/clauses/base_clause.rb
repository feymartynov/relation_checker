module RelationChecking
  module Clauses
    class BaseClause
      def check_against(_)
        raise NotImplementedError
      end
    end
  end
end
