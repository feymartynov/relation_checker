require 'integration_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "5 Limit and Offset")

describe 'limit and offset' do
  before do
    class Client < ActiveRecord::Base; end
  end

  it 'should support limiting' do
    expect(Client).to be_equal_to_a_checker_with(proc { |m| m.limit(5) })
  end

  it 'should support limiting with offset' do
    expect(Client).to be_equal_to_a_checker_with(proc { |m| m.limit(5).offset(30) })
  end
end
