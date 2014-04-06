require 'integration_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "4 Selecting Specific Fields")

describe 'selecting specific fields' do
  before do
    class Client < ActiveRecord::Base; end
  end

  it 'should support plain text specified subsets' do
    expect(Client).to be_equal_to_a_checker_with(proc { |m| m.select("viewable_by, locked") })
  end

  it 'should support single record per uniq value query' do
    expect(Client).to be_equal_to_a_checker_with(proc { |m| m.select(:name).distinct })
  end

  it 'should support distinct disabling' do
    expect(Client).to be_equal_to_a_checker_with(proc { |m|
      query = m.select(:name).distinct
      query.distinct(false) })
  end
end
