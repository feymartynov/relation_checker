require 'spec_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "2 Conditions")

describe 'conditions checking' do
  it 'should support pure string conditions' do
    # Client.where("orders_count = '2'")
    pending
  end

  it 'should support NOT conditions' do
    # Post.where.not(author: author)
    pending
  end

  context 'array conditions' do
    it 'should support single substitution conditions' do
      # Client.where("orders_count = ?", params[:orders])
      pending
    end

    it 'should support multiple substitution conditions' do
      # Client.where("orders_count = ? AND locked = ?", params[:orders], false)
      pending
    end

    it 'should support placeholder conditions' do
      # Client.where("created_at >= :start_date AND created_at <= :end_date",
      #              {start_date: params[:start_date], end_date: params[:end_date]})
      pending
    end
  end

  context 'hash conditions' do
    it 'should support symbol keys' do
      # Client.where(locked: true)
      pending
    end

    it 'should support string keys' do
      # Client.where('locked' => true)
      pending
    end

    it 'should support subhashes for joined tables' do
      # Author.joins(:posts).where(posts: {author: author})
      pending
    end

    it 'should support range conditions' do
      # Client.where(created_at: (Time.now.midnight - 1.day)..Time.now.midnight)
      pending
    end

    it 'should support subset conditions' do
      # Client.where(orders_count: [1,3,5])
      pending
    end
  end
end
