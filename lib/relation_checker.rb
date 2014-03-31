require 'checker'

class ActiveRecord::Base
  def self.relation_checker
    RelationChecking::Checker.new(self)
  end
end
