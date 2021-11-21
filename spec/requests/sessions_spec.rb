require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  #get -> post -> check body respond,status
  describe "#create" do
    context "with valid credentials" do
      let :credentials do
        { :username => 'admin', :password => 'my password' }
      end

      let :user do
        FactoryBot.create(:user, credentials)
      end

      before :each do
        post '/login', credentials
      end

      it "creates a user session" do
        session[:user_id].should == user.id
      end
    end

    # ...
  end
end
