Dir[File.dirname(__FILE__) + '/clauses/*.rb'].each {|file| require file }

module RelationChecking
  class Checker
    attr_reader :klass, :clauses

    def initialize(klass)
      @klass = klass
      @clauses = []
    end

    def ==(relation)
       unless check_class_against(relation)
         fail ArgumentError.new("The argument relation must intend the #{@klass.to_s} model")
       end

       check_clauses_against(relation)
    end

    def method_missing(method_name, *args, &block)
      clause_class = find_clause_class_for(method_name)

      if clause_class
        add_clause(clause_class, args)
        self
      else
        super
      end
    end

    private

    def check_class_against(relation)
      relation.klass <= @klass
    end

    def check_clauses_against(relation)
      clauses.all? { |clause| clause.check_against(relation) }
    end

    def add_clause(clause_class, args)
      clauses << clause_class.new(*args)
    end

    def find_clause_class_for(clause_name)
      clause_class = begin
        RelationChecking::Clauses.const_get("#{clause_name.to_s.classify}Clause")
      rescue NameError
        nil
      end

      if clause_class.is_a?(Class) && clause_class < RelationChecking::Clauses::BaseClause
        clause_class
      else
        nil
      end
    end
  end
end
