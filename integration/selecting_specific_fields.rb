require 'spec_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "4 Selecting Specific Fields")

describe 'selecting specific fields' do
  it 'should support plain text specified subsets' do
    # Client.select("viewable_by, locked")
    pending
  end

  it 'should support single record per uniq value query' do
    # Client.select(:name).distinct
    pending
  end

  it 'should support distinct disabling' do
    # query = Client.select(:name).distinct
    # query.distinct(false)
    pending
  end
end
