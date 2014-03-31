require 'checker'

module RelationChecking
  extend ActiveSupport::Concern

  module ClassMethods
    def relation_checker
      Checker.new(self)
    end
  end
end

class ActiveRecord::Base
  include RelationChecking
end
