require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

class Post < ActiveRecord::Base
  belongs_to :author
end

class Author < ActiveRecord::Base
  has_many :posts
end

describe Post do
  before(:each) do
    @post = Post.create!(:body => 'The body.')
  end
  
  it "should contain a body" do
    @post.body.should_not be_empty
  end
end