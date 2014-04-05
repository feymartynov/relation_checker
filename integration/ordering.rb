require 'spec_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "3 Ordering")

describe 'conditions checking' do
  it 'should support ascending order by field specified with a symbol' do
    # Client.order(:created_at)
    pending
  end

  it 'should support ascending order by field specified with a string' do
    # Client.order("created_at")
    pending
  end

  context 'specification of sorting direction with a hash' do
    it 'should support desc sorting' do
      # Client.order(created_at: :desc)
      pending
    end

    it 'should support asc sorting' do
      # Client.order(created_at: :asc)
      pending
    end

    it 'should support multiple fields' do
      # Client.order(orders_count: :asc, created_at: :desc)
      pending
    end

    it 'should support mixed fields specification' do
      # Client.order(:orders_count, created_at: :desc)
      pending
    end
  end

  context 'pure string ordering' do
    it 'should support desc sorting' do
      # Client.order("created_at DESC")
      pending
    end

    it 'should support asc sorting' do
      # Client.order("created_at ASC")
      pending
    end

    it 'should support multiple fields' do
      # Client.order("orders_count ASC, created_at DESC")
      pending
    end

    it 'should support multiple fields specified by multiple arguments' do
      # Client.order("orders_count ASC", "created_at DESC")
      pending
    end
  end
end
