require 'integration_helper'

describe 'merging of checkers' do
  before do
    class Author < ActiveRecord::Base; end

    class Post < ActiveRecord::Base
      belongs_to :author
    end
  end

  let(:post_chain) { proc { |m| m.where('created_at > ?', 7.days.ago).includes(:author) } }
  let(:post_checker) { Post.relation_checker.instance_eval(&post_chain) }

  let(:author_chain) { proc { |m| m.where('rating > 10') } }
  let(:author_checker) { Author.relation_checker.instance_eval(&author_chain) }

  let(:relation) { Post.instance_eval(&post_chain) & Author.instance_eval(&author_chain) }

  it 'should support merging of checkers with #merge method' do
    merged_checker = post_checker.merge(author_checker)
    expect(merged_checker).to eq(relation)
  end

  it 'should support merging of checkers with & operator' do
    merged_checker = post_checker & author_checker
    expect(merged_checker).to eq(relation)
  end
end
