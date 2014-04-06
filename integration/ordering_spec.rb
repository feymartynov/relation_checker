require 'integration_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "3 Ordering")

describe 'conditions checking' do
  before do
    class Client < ActiveRecord::Base; end
  end

  it 'should support ascending order by field specified with a symbol' do
    expect(Client).to be_equal_to_a_checker_with(proc { |m| m.order(:created_at) })
  end

  it 'should support ascending order by field specified with a string' do
    expect(Client).to be_equal_to_a_checker_with(proc { |m| m.order('created_at') })
  end

  context 'specification of sorting direction with a hash' do
    it 'should support desc sorting' do
      expect(Client).to be_equal_to_a_checker_with(proc { |m| m.order(created_at: :desc) })
    end

    it 'should support asc sorting' do
      expect(Client).to be_equal_to_a_checker_with(proc { |m| m.order(created_at: :asc) })
    end

    it 'should support multiple fields' do
      expect(Client).to be_equal_to_a_checker_with(proc { |m| m.order(order_count: :asc, created_at: :desc) })
    end

    it 'should support mixed fields specification' do
      expect(Client).to be_equal_to_a_checker_with(proc { |m| m.order(:orders_count, created_at: :desc) })
    end
  end

  context 'pure string ordering' do
    it 'should support desc sorting' do
      expect(Client).to be_equal_to_a_checker_with(proc { |m| m.order('created_at DESC') })
    end

    it 'should support asc sorting' do
      expect(Client).to be_equal_to_a_checker_with(proc { |m| m.order('created_at ASC') })
    end

    it 'should support multiple fields' do
      expect(Client).to be_equal_to_a_checker_with(proc { |m| m.order('orders_count ASC, created_at DESC') })
    end

    it 'should support multiple fields specified by multiple arguments' do
      expect(Client).to be_equal_to_a_checker_with(proc { |m| m.order('orders_count ASC', 'created_at DESC') })
    end
  end
end
