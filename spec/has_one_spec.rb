require File.dirname(__FILE__) + '/spec_helper'

describe Author do
  before(:each) do
    @author = Author.create!(:name => 'James Madison')
  end
  
  describe "without a profile" do
    it "should not have null object support for the profile" do
      @author.profile.should be_nil
      @author.profile.kind_of?(Profile).should be_false
      @author.profile.respond_to?(:age).should be_false
    end
  end

  describe "with a profile" do
    before(:each) do
      @author.profile.create!(:age => 56)
    end
    it "should have an age" do
      @author.profile.age.should == 56
    end
  end

  describe "without an account" do
    it "should not have null object support for the account" do
      @author.account.should be_nil
      @author.account.kind_of?(Account).should be_false
      @author.account.respond_to?(:age).should be_false
    end
  end

  describe "with an account" do
    before(:each) do
      @author.account.create!(:password => 'secret')
    end
    it "should have an age" do
      @author.account.password.should == 'secret'
    end
  end

  describe "without an address" do
    it "should return a null object for the address" do
      @author.address.kind_of?(NullAddress).should be_true
    end
    
    it "should be nil" do
      @author.address.should be_nil
    end
    
    it "should return true for author.address.nil?" do
      @author.address.nil?.should be_true
    end
    
    it "should return false for author.address.present?" do
      @author.address.present?.should be_false
    end
    
    it "should return nil for the address's street" do
      @author.address.street.should be_nil
    end
  end

  describe "with an address" do
    before(:each) do
      @author.address.create!(:street => '1600 Pennsylvania Ave')
    end

    it "should return the author object" do
      @author.address.kind_of?(Address).should be_true
      @author.address.kind_of?(NullAddress).should_not be_true
    end
    
    it "should return false for author.address.nil?" do
      @author.address.nil?.should be_false
    end
    
    it "should return true for author.address.present?" do
      @author.address.present?.should be_true
    end
    
    it "should return the author's street" do
      @author.address.street.should == '1600 Pennsylvania Ave'
    end
    
    it "should revert to a null object if assigned nil" do
      @author.address = nil
      @author.address.street.should be_nil
    end
  end  
end
