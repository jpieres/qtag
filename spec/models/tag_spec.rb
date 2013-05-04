require 'spec_helper'

describe Tag do
  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is wrong!
    @tag = user.tags.build(hashtag: "AAAAAAAA", name: "A name", description: "Cute tag")
  end

  subject { @tag }

  it { should respond_to(:hashtag) }
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:user) }
  its(:user) { should == user }


  it { should be_valid }

  describe "when user_id is not present" do
    before { @tag.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank name" do
    before { @tag.name = " " }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Tag.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

end
