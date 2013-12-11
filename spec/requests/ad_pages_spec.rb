require 'spec_helper'

describe "Ad pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "ad creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a ad" do
        expect { click_button "Post" }.not_to change(Ad, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'ad_content', with: "Lorem ipsum" }
      it "should create a ad" do
        expect { click_button "Post" }.to change(Ad, :count).by(1)
      end
    end
  end
end