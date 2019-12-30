require File.dirname(__FILE__) + '/spec_helper'

describe NullAuthor do

  subject(:null_author) { Comment.new.author }

  it { should be_kind_of Author }

  it "should be a singleton" do
    expect { NullAuthor.new }.to raise_error(NoMethodError)
  end

  it { should be_nil }
  it { should be_empty }
  it { should be_blank }
  it { should_not be_present }
  its(:id) { should be_nil }
  it { should be_new_record }

  context "when saving with save" do
    its(:save) { should be false }

    it "should not create a new record" do
      expect { null_author.save }.to_not change { NullAuthor.count }
    end

    it "should add an error" do
      expect(null_author.errors[:base]).to eq ["is a null object and can't be saved"]
    end
  end

  context "when saving with save!" do
    it "should raise an exception" do
      expect { null_author.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "should not create a new record" do
      expect {
        begin
          null_author.save!
        rescue ActiveRecord::RecordInvalid
        end
      }.to_not change { NullAuthor.count }
    end

    it "should add an error" do
      expect(null_author.errors[:base]).to eq ["is a null object and can't be saved"]
    end
  end

  context "when updating attributes" do
    it "should return false" do
      expect(null_author.update({})).to be false
    end

    it "should not create a new record" do
      expect { null_author.update({}) }.to_not change { NullAuthor.count }
    end

    it "should add an error" do
      expect(null_author.errors[:base]).to eq ["is a null object and can't be saved"]
    end
  end

  its(:name) { should be_nil }

end
