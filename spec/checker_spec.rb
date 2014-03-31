require 'spec_helper'

describe RelationChecking::Checker do
  subject { RelationChecking::Checker.new(klass) }
  let(:klass) { double(:klass) }

  before do
    allow(klass).to receive(:<=).with(klass).and_return(true)
  end

  describe '#==' do
    let(:relation) { double(:relation, klass: klass) }
    let(:clauses) do
      3.times.map do
        clause = double(:clause)
        allow(clause).to receive(:check_against).with(relation).and_return(true)
        clause
      end
    end

    before do
      allow(subject).to receive(:clauses).and_return(clauses)
    end

    it 'should return true if all of the clauses are passing' do
      expect(subject == relation).to eq(true)
    end

    it 'should return false if any of the clauses checking fails' do
      allow(subject.clauses.sample).to receive(:check_against).with(relation).and_return(false)
      expect(subject == relation).to eq(false)
    end

    context 'wrong relation' do
      let(:wrong_klass) { double(:wrong_klass) }

      before do
        allow(relation).to receive(:klass).and_return(wrong_klass)
        allow(wrong_klass).to receive(:<=).with(klass).and_return(false)
      end

      it 'should fail with ArgumentError if the argument relation intends to a wrong model' do
        expect { subject == relation }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#method_missing' do
    context 'clause method call' do
      before :all do
        class RelationChecking::Checker::DummyClause < RelationChecking::Checker::Clause
          def check_against(_)
            true
          end
        end
      end

      it 'should add the requested clause' do
        subject.method_missing(:dummy)
        expect(subject.clauses.first.class).to eq(RelationChecking::Checker::DummyClause)
      end

      it 'should pass the arguments to the clause constructor' do
        args = [:some, :arguments]
        expect(RelationChecking::Checker::DummyClause).to receive(:new).with(*args)
        subject.dummy(*args)
      end

      it 'should chain the call' do
        expect(subject.method_missing(:dummy)).to eq(subject)
      end
    end

    context 'misc call' do
      it 'should behave as default method_missing' do
        expect { subject.method_missing(:something_missing) }.to raise_error(NoMethodError)
      end
    end
  end
end
