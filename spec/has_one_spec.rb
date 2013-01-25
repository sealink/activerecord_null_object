require File.dirname(__FILE__) + '/spec_helper'

describe Author do
  subject(:author) { Author.create!(:name => 'James Madison') }

  context "its profile" do
    subject(:profile) { author.profile }

    context "when not present" do
      context "without null object support for the profile" do
        it { should be_nil }
        it { should_not be_kind_of Profile }
        it { should_not respond_to :age }
      end
    end

    context "when present" do
      before { author.create_profile!(:age => 56) }

      its(:age) { should == 56 }
    end
  end

  context "its account" do
    subject(:account) { author.account }

    context "when not present" do
      context "without null object support for the account" do
        it { should be_nil }
        it { should_not be_kind_of Account }
        it { should_not respond_to :password }
      end
    end

    context "when present" do
      before { author.create_account!(:password => 'secret') }

      its(:password) { should == 'secret' }
    end
  end


  context "its address" do
    subject(:address) { author.address }

    context "when not present" do
      it { should be_kind_of NullAddress }
      it { should be_nil }
      it { should_not be_present }
      its(:street) { should be_nil }
    end

    context "when present" do
      before { author.create_address!(:street => '1600 Pennsylvania Ave') }

      it { should be_kind_of Address }
      it { should_not be_kind_of NullAddress }
      it { should_not be_nil }
      it { should be_present }
      its(:street) { should == '1600 Pennsylvania Ave' }

      context "when the address is removed" do
        before { author.address = nil }
        its(:street) { should be_nil }
      end
    end

  end

end
