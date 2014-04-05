require 'spec_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "7 Having")

describe 'having' do
  it 'should support having condition' do
    # Order.select("date(created_at) as ordered_date, sum(price) as total_price").
    #     group("date(created_at)").having("sum(price) > ?", 100)
    pending
  end
end
