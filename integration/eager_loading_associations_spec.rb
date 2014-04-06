require 'integration_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "13 Eager Loading Associations")

describe 'eager loading associations' do
  it 'should support inclusion an array of multiple associations' do
    class Post < ActiveRecord::Base; end
    expect(Post).to be_equal_to_a_checker_with(proc { |m| m.includes(:category, :comments) })
  end

  it 'should support inclusion of nested associations specified by a hash' do
    class Category < ActiveRecord::Base; end
    expect(Category).to be_equal_to_a_checker_with(proc { |m| m.includes(posts: [{comments: :guest}, :tags]) })
  end

  it 'should support specifying conditions on eager loaded associations' do
    class Category < ActiveRecord::Base; end
    expect(Post).to be_equal_to_a_checker_with(proc { |m| m.includes(:comments).where("comments.visible" => true) })
  end
end
