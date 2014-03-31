require 'spec_helper'

describe RelationChecking::Checker::WhereClause::ValuesExtractor::ValueAdapter do
  describe '#left_value' do
    it 'should return the name of the left part' do
      pending
    end
  end

  describe '#right_value' do
    context Arel::Nodes::Equality do
      it 'should return the right part' do
        pending
      end
    end

    context Arel::Nodes::Between do
      it 'should return a range between the left and right borders' do
        pending
      end
    end

    it 'should raise NotImplementedError for the unknown node type' do
      pending
    end
  end
end
