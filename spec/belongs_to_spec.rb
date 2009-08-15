require File.dirname(__FILE__) + '/spec_helper'

describe Comment do
  before(:each) do
    @comment = Comment.create!(:body => 'The body.')
  end
  
  it "should contain a body" do
    @comment.body.should == 'The body.'
  end

  describe "without an author" do
    it "should return a null object for the author" do
      @comment.author.kind_of?(NullAuthor).should be_true
    end
    
    it "should be nil" do
      @comment.author.should be_nil
    end
    
    it "should return true for comment.author.nil?" do
      @comment.author.nil?.should be_true
    end
    
    it "should return false for comment.author.present?" do
      @comment.author.present?.should be_false
    end
    
    it "should return nil for the author's name" do
      @comment.author.name.should be_nil
    end
  end
  
  describe "with an author" do
    before(:each) do
      @comment.author = Author.create!(:name => 'James Baker')
    end
    
    it "should return the author object" do
      @comment.author.kind_of?(Author).should be_true
      @comment.author.kind_of?(NullAuthor).should_not be_true
    end
    
    it "should return false for comment.author.nil?" do
      @comment.author.nil?.should be_false
    end
    
    it "should return true for comment.author.present?" do
      @comment.author.present?.should be_true
    end
    
    it "should return the author's name" do
      @comment.author.name.should == 'James Baker'
    end
    
    it "should revert to a null object if assigned nil" do
      @comment.author = nil
      @comment.author.name.should be_nil
    end
  end
end

describe Post do
  before(:each) do
    @post = Post.create!(:body => 'The body.')
  end
  
  it "should contain a body" do
    @post.body.should == 'The body.'
  end
  
  it "should not have null object support for the author" do
    @post.author.should be_nil
    @post.author.kind_of?(Author).should be_false
    @post.author.respond_to?(:name).should be_false
  end
end

describe Session do
  before(:each) do
    @session = Session.create!(:description => 'The description.')
  end
  
  it "should contain a description" do
    @session.description.should == 'The description.'
  end
  
  it "should not have null object support for the author" do
    @session.author.should be_nil
    @session.author.kind_of?(Author).should be_false
    @session.author.respond_to?(:name).should be_false
  end
end
