require 'integration_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "6 Group")

describe 'group' do
  before do
    class Order < ActiveRecord::Base; end
  end

  it 'should support grouping by pure string specified field' do
    expect(Order).to be_equal_to_a_checker_with(
      proc { |m| m.select("date(created_at) as ordered_date, sum(price) as total_price")
                  .group("date(created_at)") })
  end

  it 'should support grouping by symbol specified field' do
    expect(Order).to be_equal_to_a_checker_with(
      proc { |m| m.select("date(created_at) as ordered_date, sum(price) as total_price")
                  .group(:'date(created_at)') })
  end
end
