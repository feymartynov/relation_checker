require 'spec_helper'

describe RelationChecking::Clauses::OrderClause do
  let(:order_values) { ActiveSupport::OrderedHash[:created_at, :desc, :updated_at, :asc] }
  let(:relation) { double(:relation,
                          klass: double(:model_class, table_name: 'dummy_table'),
                          arel: double(:arel, orders: relation_order_values)) }

  subject { RelationChecking::Clauses::OrderClause.new(order_values) }

  describe '#check_against' do
    context 'relation\'s order values match expectations' do
      let(:relation_order_values) { ['"dummy_table".created_at DESC',
                                     '"dummy_table".updated_at ASC'] }

      it 'should return true' do
        expect(subject.check_against(relation)).to eq(true)
      end
    end

    context 'not all of the order keys are present in the given relation' do
      let(:relation_order_values) { ['"dummy_table".created_at DESC'] }

      it 'should return false' do
        expect(subject.check_against(relation)).to eq(false)
      end
    end

    context 'all of the order keys are present but not in the same order' do
      let(:relation_order_values) { ['"dummy_table".updated_at ASC',
                                     '"dummy_table".created_at DESC'] }

      it 'should return false' do
        expect(subject.check_against(relation)).to eq(false)
      end
    end

    context 'some of the order directions don\'t match the expected one' do
      let(:relation_order_values) { ['"dummy_table".created_at DESC',
                                     '"dummy_table".updated_at DESC'] }

      it 'should return false' do
        expect(subject.check_against(relation)).to eq(false)
      end
    end
  end
end
