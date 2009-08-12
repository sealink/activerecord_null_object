require File.dirname(__FILE__) + '/spec_helper'

describe Post do
  before(:each) do
    @post = Post.create!(:body => 'The body.')
  end
  
  it "should contain a body" do
    @post.body.should_not be_empty
  end
end