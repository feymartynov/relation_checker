require 'spec_helper'

describe RelationChecking::Checker::Clause do
  describe '#check_against' do
    it 'should be abstract' do
      expect { subject.check_against(double(:relation)) }.to raise_error(NotImplementedError)
    end
  end
end
