require 'spec_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "6 Group")

describe 'group' do
  it 'should support grouping by pure string specified field' do
    # Order.select("date(created_at) as ordered_date, sum(price) as total_price").group("date(created_at)")
    pending
  end

  it 'should support grouping by symbol specified field' do
    # Order.select("date(created_at) as ordered_date, sum(price) as total_price").group(:'date(created_at)')
    pending
  end
end
