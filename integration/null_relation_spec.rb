require 'integration_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "9 Null Relation")

describe 'null relation' do
  it 'should support null relation' do
    class Post < ActiveRecord::Base; end
    expect(Post).to be_equal_to_a_checker_with(proc { |m| m.none })
  end
end
