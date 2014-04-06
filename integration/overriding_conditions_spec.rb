require 'integration_helper'

# Test cases have been composed based on ActiveRecord Query Interface guide
# http://guides.rubyonrails.org/active_record_querying.html (chapter "8 Overriding Conditions")

describe 'overriding conditions' do
  before do
    class Comment < ActiveRecord::Base; end

    class Post < ActiveRecord::Base
      has_many :comments, order: 'posted_at DESC'
    end
  end

  it 'should support clause exception' do
    expect(Post).to be_equal_to_a_checker_with(proc { |m|
      m.where('id > 10').limit(20).order('id asc').except(:order) })
  end

  it 'should support only method' do
    expect(Post).to be_equal_to_a_checker_with(proc { |m|
      m.where('id > 10').limit(20).order('id desc').only(:order, :where) })
  end

  it 'should support reordering default scope order' do
    post = Post.new
    expect(post.comments).to be_equal_to_a_checker_with(proc { |m| m.reorder('name') })
  end

  context 'unscoping' do
    it 'should support unscoping' do
      expect(Post).to be_equal_to_a_checker_with(proc { |m|
        m.order('id DESC').limit(20).unscope(:order) })
    end

    it 'should support unscoping of multiple clauses' do
      expect(Post).to be_equal_to_a_checker_with(proc { |m|
        m.order('id DESC').limit(20).unscope(:order, :limit) })
    end

    it 'should support unscoping of specific where clauses' do
      expect(Post).to be_equal_to_a_checker_with(proc { |m|
        m.where(:id => 10).limit(1).unscope({where: :id}, :limit).order('id DESC') })
    end
  end

  context 'order reversion' do
    before do
      class Client < ActiveRecord::Base; end
    end

    it 'should support order reversion' do
      expect(Client).to be_equal_to_a_checker_with(proc { |m|
        m.where("orders_count > 10").order(:name).reverse_order })
    end

    it 'should support reversion by primary key' do
      expect(Client).to be_equal_to_a_checker_with(proc { |m|
        m.where("orders_count > 10").reverse_order })
    end
  end
end
