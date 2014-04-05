require 'spec_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "8 Overriding Conditions")

describe 'overriding conditions' do
  it 'should support clause exception' do
    # Post.where('id > 10').limit(20).order('id asc').except(:order)
    pending
  end

  it 'should support only method' do
    # Post.where('id > 10').limit(20).order('id desc').only(:order, :where)
    pending
  end

  it 'should support reordering default scope order' do
    # class Post < ActiveRecord::Base
    #   ..
    #   ..
    #   has_many :comments, order: 'posted_at DESC'
    # end
    #
    # Post.find(10).comments.reorder('name')
    pending
  end

  context 'unscoping' do
    it 'should support unscoping' do
      # Post.order('id DESC').limit(20).unscope(:order)
      pending
    end

    it 'should support unscoping of multiple clauses' do
      # Post.order('id DESC').limit(20).unscope(:order, :limit)
      pending
    end

    it 'should support unscoping of specific where clauses' do
      # Post.where(:id => 10).limit(1).unscope(where: :id, :limit).order('id DESC') = Post.order('id DESC')
      pending
    end
  end

  context 'order reversion' do
    it 'should support order reversion' do
      # Client.where("orders_count > 10").order(:name).reverse_order
      pending
    end

    it 'should support reversion by primary key' do
      # Client.where("orders_count > 10").reverse_order
      pending
    end
  end
end
