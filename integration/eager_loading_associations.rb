require 'spec_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "13 Eager Loading Associations")

describe 'eager loading associations' do
  it 'should support inclusion an array of multiple associations' do
    # Post.includes(:category, :comments)
    pending
  end

  it 'should support inclusion of nested associations specified by a hash' do
    # Category.includes(posts: [{comments: :guest}, :tags])
    pending
  end

  it 'should support specifying conditions on eager loaded associations' do
    # Post.includes(:comments).where("comments.visible" => true)
    pending
  end
end
