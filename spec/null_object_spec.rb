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
  
  it "should be empty" do
    @null_author.empty?.should be_true
  end
  
  it "should be blank" do
    @null_author.blank?.should be_true
  end
  
  it "should not be present" do
    @null_author.present?.should be_false
  end

  describe "#id" do
    it "should return nil" do
      @null_author.id.should be_nil
    end
  end
  
  describe "#new_record?" do
    it "should return true" do
      @null_author.new_record?.should be_true
    end
  end
  
  describe "#save" do
    it "should return false" do
      @null_author.save.should be_false
    end
    
    it "should not create a new record" do
      lambda { @null_author.save }.should_not change { NullAuthor.count }
    end
    
    it "should add an error" do
      @null_author.errors.on(:base).should == "is a null object and can't be saved"
    end
  end
  
  describe "#save!" do
    it "should raise an exception" do
      lambda { @null_author.save! }.should raise_error(ActiveRecord::RecordInvalid)
    end
    
    it "should not create a new record" do
      lambda { 
        begin
          @null_author.save! 
        rescue ActiveRecord::RecordInvalid
        end
      }.should_not change { NullAuthor.count }
    end

    it "should add an error" do
      @null_author.errors.on(:base).should == "is a null object and can't be saved"
    end
  end

  describe "#update_attributes" do
    it "should return false" do
      @null_author.update_attributes({}).should be_false
    end
    
    it "should not create a new record" do
      lambda { @null_author.update_attributes({}) }.should_not change { NullAuthor.count }
    end

    it "should add an error" do
      @null_author.errors.on(:base).should == "is a null object and can't be saved"
    end
  end
  
  describe "#name" do
    it "should return nil" do
      @null_author.name.should be_nil
    end
  end
  
end