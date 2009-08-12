require File.dirname(__FILE__) + '/spec_helper'

describe NullAuthor do
  
  before(:each) do
    @null_author = Comment.new.author
  end
  
  it "should be a kind of Author" do
    @null_author.kind_of?(Author).should be_true
  end

  it "should be a singleton" do
    lambda { NullAuthor.new }.should raise_error(NoMethodError)
  end
  
  it "should be nil" do
    @null_author.nil?.should be_true
    @null_author.should be_nil
  end

  describe "#id" do
    it "should return nil" do
      @null_author.id.should be_nil
    end
  end
  
  describe "#new_record?" do
    it "should return false" do
      @null_author.new_record?.should be_false
    end
  end
  
  describe "#save" do
    it "should return true" do
      @null_author.save.should be_true
    end
    
    it "should not create a new record" do
      lambda { @null_author.save }.should_not change { NullAuthor.count }
    end
  end
  
  describe "#save!" do
    it "should return true" do
      @null_author.save!.should be_true
    end
    
    it "should not create a new record" do
      lambda { @null_author.save! }.should_not change { NullAuthor.count }
    end
  end

  describe "#update_attributes" do
    it "should return true" do
      @null_author.update_attributes({}).should be_true
    end
    
    it "should not create a new record" do
      lambda { @null_author.update_attributes({}) }.should_not change { NullAuthor.count }
    end
  end
  
  describe "#name" do
    it "should return nil" do
      @null_author.name.should be_nil
    end
  end
  
end