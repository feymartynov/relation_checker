require 'spec_helper'

describe RelationChecking::Checker do
  describe '#==' do
    it 'should return true if all of the clauses are passing' do
      pending
    end

    it 'should return false if any of the clauses checking fails' do
      pending
    end

    it 'should fail with ArgumentError if the argument relation intends to a wrong model' do
      pending
    end
  end

  describe '#method_missing' do
    context 'clause method call' do
      it 'should add the requested clause with the specified arguments' do
        pending
      end

      it 'should chain the call' do
        pending
      end
    end

    context 'misc call' do
      it 'should behave as default' do
        pending
      end
    end
  end
end
