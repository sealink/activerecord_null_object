require File.dirname(__FILE__) + '/spec_helper'

describe Comment do
  subject(:comment) { Comment.create!(:body => 'The body.') }

  its(:body) { should == 'The body.' }

  context "its author" do
    subject(:author) { comment.author }

    context "when not present" do
      it { should be_kind_of NullAuthor }
      it { should be_nil }
      it { should_not be_present }
      its(:name) { should be_nil }
    end

    context "when present" do
      before { comment.create_author!(:name => 'James Baker') }

      it { should be_kind_of Author }
      it { should_not be_kind_of NullAuthor }
      it { should_not be_nil }
      it { should be_present }
      its(:name) { should == 'James Baker' }

      context "when removed" do
        before { comment.author = nil }
        its(:name) { should be_nil }
      end
    end
  end
end

describe Post do
  subject(:post) { Post.create!(:body => 'The body.') }

  its(:body) { should == 'The body.' }

  context "without null object support for the author" do
    subject(:author) { post.author }

    it { should be_nil }
    it { should_not be_kind_of Author }
    it { should_not respond_to :name }
  end
end

describe Session do
  subject(:session) { Session.create!(:description => 'The description.') }

  its(:description) { should == 'The description.' }

  context "without null object support for the author" do
    subject(:author) { session.author }

    it { should be_nil }
    it { should_not be_kind_of Author }
    it { should_not respond_to :name }
  end
end
