module RelationChecking
  class Checker
    class WhereClause < Clause
      class ValuesExtractor
        class ValueAdapter
          class_attribute :right_values

          self.right_values = {
            Arel::Nodes::Equality => proc { |v| v },
            Arel::Nodes::Between => proc { |v| v.left..v.right } }

          def initialize(value)
            @value = value
          end

          def left_value
            @value.left.name
          end

          def right_value
            value_proc = self.right_values[@value.class]

            if value_proc.respond_to?(:call)
              value_proc.call(@value.right)
            else
              raise NotImplementedError
            end
          end
        end
      end
    end
  end
end
