require 'rspec/expectations'

RSpec::Matchers.define :be_equal_to_a_checker_with do |chain_proc|
  match do |klass|
    relation = klass.instance_eval(&chain_proc)
    checker = klass.relation_checker.instance_eval(&chain_proc)
    checker == relation
  end
end
