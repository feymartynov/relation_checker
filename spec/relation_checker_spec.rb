require 'spec_helper'

describe ActiveRecord::Base do
  let(:checker) { double(:checker) }

  before do
    class DummyModel < ActiveRecord::Base; end
    allow(RelationChecking::Checker).to receive(:new).with(DummyModel).and_return(checker)
  end

  describe '.relation_checker' do
    it 'should return a new checker instance passing the object to it' do
      expect(DummyModel.relation_checker).to eq(checker)
    end
  end
end
