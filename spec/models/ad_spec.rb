require 'spec_helper'

describe Ad do

  let(:user) { FactoryGirl.create(:user) }
  before { @ad = user.ads.build(content: "Lorem ipsum") }

  subject { @ad }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @ad.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "with blank content" do
    before { @ad.content = " " }
    it { should_not be_valid }
  end

  describe "with content that is too long" do
    before { @ad.content = "a" * 141 }
    it { should_not be_valid }
  end
  
end