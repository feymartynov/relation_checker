require 'spec_helper'

describe RelationChecking::Clauses::WhereClause do
  let(:conditions) { {'public' => true, 'price' => 10..20} }
  let(:relation) { double(:relation, where_values: conditions) }
  subject { RelationChecking::Clauses::WhereClause.new(conditions) }

  describe '#check_against' do
    context do
      before do
        extractor = RelationChecking::Clauses::WhereClause::ValuesExtractor
        allow(extractor).to receive(:new).with(conditions)
                            .and_return(double(:extractor, to_h: conditions))
      end

      it 'should return true if all conditions of the clause are present and match conditions in the relation' do
        expect(subject.check_against(relation)).to eq(true)
      end

      it 'should be indifferent to hash keys' do
        subject { RelationChecking::Clauses::WhereClause.new(conditions.symbolize_keys) }
        expect(subject.check_against(relation)).to eq(true)
      end
    end

    it 'should return false if not all of the conditions are present in the given relation' do
      insufficient_conditions = conditions.dup.tap { |c| c.delete(c.keys.sample) }
      relation = double(:relation, where_values: insufficient_conditions)

      extractor = RelationChecking::Clauses::WhereClause::ValuesExtractor
      allow(extractor).to receive(:new).with(insufficient_conditions)
                                       .and_return(double(:extractor, to_h: insufficient_conditions))

      expect(subject.check_against(relation)).to eq(false)
    end

    it 'should return false if any pair of the condition values doesn\'t match' do
      wrong_conditions = conditions.dup.tap { |c| c[c.keys.sample] = :wrong_value }
      relation = double(:relation, where_values: wrong_conditions)

      extractor = RelationChecking::Clauses::WhereClause::ValuesExtractor
      allow(extractor).to receive(:new).with(wrong_conditions)
                                       .and_return(double(:extractor, to_h: wrong_conditions))

      expect(subject.check_against(relation)).to eq(false)
    end
  end
end
