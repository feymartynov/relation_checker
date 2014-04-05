require 'spec_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "12 Joining Tables")

describe 'joining tables' do
  it 'should support joining by using a string SQL fragment' do
    # Client.joins('LEFT OUTER JOIN addresses ON addresses.client_id = clients.id')
    pending
  end

  it 'should support joining a single association' do
    # Category.joins(:posts)
    pending
  end

  it 'should support joining multiple associations' do
    # Category.joins(:posts, :comments)
    pending
  end

  it 'should support joining nested associations (single level)' do
    # Post.joins(comments: :guest)
    pending
  end

  it 'should support joining nested associations (multiple level)' do
    # Category.joins(posts: [{comments: :guest}, :tags])
    pending
  end

  context 'specifying conditions on the joined tables' do
    it 'should support string keys' do
      # time_range = (Time.now.midnight - 1.day)..Time.now.midnight
      # Client.joins(:orders).where('orders.created_at' => time_range)
      pending
    end

    it 'should support nested hash conditions' do
      # time_range = (Time.now.midnight - 1.day)..Time.now.midnight
      # Client.joins(:orders).where(orders: {created_at: time_range})
      pending
    end
  end
end
