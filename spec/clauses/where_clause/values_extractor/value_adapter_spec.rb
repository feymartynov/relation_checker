require 'spec_helper'

describe RelationChecking::Clauses::WhereClause::ValuesExtractor::ValueAdapter do
  let(:value) { double(:value) }
  subject { RelationChecking::Clauses::WhereClause::ValuesExtractor::ValueAdapter.new(value) }

  describe '#left_value' do
    let(:left_value) { double(:left_value, name: :field_name) }

    before do
      allow(value).to receive(:left).and_return(left_value)
    end

    it 'should return the name of the left part' do
      expect(subject.left_value).to eq(left_value.name)
    end
  end

  describe '#right_value' do
    context Arel::Nodes::Equality do
      let(:value) { Arel::Nodes::Equality.new(:left, :right) }

      it 'should return the right part' do
        expect(subject.right_value).to eq(value.right)
      end
    end

    context Arel::Nodes::Between do
      let(:value) { Arel::Nodes::Between.new(:left, double(:range, left: 10, right: 20)) }

      it 'should return a range between the left and right borders' do
        expect(subject.right_value).to eq(10..20)
      end
    end

    it 'should raise NotImplementedError for the unknown node type' do
      expect { subject.right_value }.to raise_error(NotImplementedError)
    end
  end
end
