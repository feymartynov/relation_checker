require 'integration_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "12 Joining Tables")

describe 'joining tables' do
  it 'should support joining by using a string SQL fragment' do
    class Client < ActiveRecord::Base; end
    expect(Client).to be_equal_to_a_checker_with(proc { |m|
      m.joins('LEFT OUTER JOIN addresses ON addresses.client_id = clients.id')})
  end

  context do
    before do
      class Category < ActiveRecord::Base; end
    end

    it 'should support joining a single association' do
      expect(Category).to be_equal_to_a_checker_with(proc { |m| m.joins(:posts) })
    end

    it 'should support joining multiple associations' do
      expect(Category).to be_equal_to_a_checker_with(proc { |m| m.joins(:posts, :comments) })
    end

    it 'should support joining nested associations (single level)' do
      expect(Category).to be_equal_to_a_checker_with(proc { |m| m.joins(comments: :guest) })
    end

    it 'should support joining nested associations (multiple level)' do
      expect(Category).to be_equal_to_a_checker_with(proc { |m|
        m.joins(posts: [{comments: :guest}, :tags]) })
    end
  end

  context 'specifying conditions on the joined tables' do
    before do
      class Client < ActiveRecord::Base; end
    end

    it 'should support string keys' do
      time_range = (Time.now.midnight - 1.day)..Time.now.midnight
      expect(Client).to be_equal_to_a_checker_with(proc { |m|
        m.joins(:orders).where('orders.created_at' => time_range) })
    end

    it 'should support nested hash conditions' do
      time_range = (Time.now.midnight - 1.day)..Time.now.midnight
      expect(Client).to be_equal_to_a_checker_with(proc { |m|
        m.joins(:orders).where(orders: {created_at: time_range}) })
    end
  end
end
