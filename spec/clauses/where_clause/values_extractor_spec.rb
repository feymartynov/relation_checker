require 'spec_helper'

describe RelationChecking::Clauses::WhereClause::ValuesExtractor do
  let(:values) { [double(:value, left: :some_key, right: :some_value),
                  double(:value, left: :another_key, right: :another_value)] }
  subject { RelationChecking::Clauses::WhereClause::ValuesExtractor.new(values) }

  before do
    adapter = RelationChecking::Clauses::WhereClause::ValuesExtractor::ValueAdapter

    values.each do |value|
      adapter_double = double(:value_adapter, left_value: value.left, right_value: value.right)
      allow(adapter).to receive(:new).with(value).and_return(adapter_double)
    end
  end

  describe '#to_h' do
    it 'should return a hash containing left parts as keys and right parts as values' do
      values_hash = Hash[values.map { |v| [v.left, v.right] }]
      expect(subject.to_h).to eq(values_hash)
    end
  end
end
