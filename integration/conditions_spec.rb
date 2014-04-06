require 'integration_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "2 Conditions")

describe 'conditions checking' do
  before do
    class Client < ActiveRecord::Base; end
  end

  it 'should support pure string conditions' do
    expect(Client).to be_equal_to_a_checker_with(proc { |m| m.where("orders_count = '2'") })
  end

  it 'should support NOT conditions' do
    class Post < ActiveRecord::Base; end
    author = double(:author)
    expect(Post).to be_equal_to_a_checker_with(proc { |m| m.where(author: author) })
  end

  context 'array conditions' do
    it 'should support single substitution conditions' do
      params = {orders: 123}
      expect(Client).to be_equal_to_a_checker_with(proc { |m| m.where("orders_count = ?", params[:orders]) })
    end

    it 'should support multiple substitution conditions' do
      params = {orders: 123}
      expect(Client).to be_equal_to_a_checker_with(proc { |m| m.where("orders_count = ? AND locked = ?", params[:orders], false) })
    end

    it 'should support placeholder conditions' do
      params = {start_date: '2014-04-06', end_date: '2014-04-07'}
      expect(Client).to be_equal_to_a_checker_with(
        proc { |m| m.where("created_at >= :start_date AND created_at <= :end_date",
                           {start_date: params[:start_date], end_date: params[:end_date]}) })
    end
  end

  context 'hash conditions' do
    it 'should support symbol keys' do
      expect(Client).to be_equal_to_a_checker_with(proc { |m| m.where(locked: true) })
    end

    it 'should support string keys' do
      expect(Client).to be_equal_to_a_checker_with(proc { |m| m.where('locked' => true) })
    end

    it 'should support subhashes for joined tables' do
      class Author < ActiveRecord::Base; end
      author = double(:author)
      expect(Author).to be_equal_to_a_checker_with(proc { |m| m.joins(:posts).where(posts: {author: author}) })
    end

    it 'should support range conditions' do
      expect(Client).to be_equal_to_a_checker_with(proc { |m| m.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight) })
    end

    it 'should support subset conditions' do
      expect(Client).to be_equal_to_a_checker_with(proc { |m| m.where(orders_count: [1,3,5]) })
    end
  end
end
