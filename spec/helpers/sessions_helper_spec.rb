require 'spec_helper'

describe SessionsHelper do
  describe "#log_in" do
  	it "sets the session[:user_id] as the user's id" do
  		alice = Fabricate(:user)
  		log_in(alice)
  		expect(session[:user_id]).to eq(alice.id) 
  	end
  end

  describe "#current_user" do
  	it "returns the current user if one is present" do
  		@current_user = 1
  		expect(current_user).to eq(1)
  	end

  	it "sets the current user if one is not present" do
  		alice = Fabricate(:user)
  		log_in(alice)
  		expect(current_user).to eq(alice)  		
  	end
  end

  describe "#logged_in?" do
  	it "Returns true if the user is logged in" do
  		alice = Fabricate(:user)
  		log_in(alice)
  		expect(logged_in?).to eq(true)
  	end

  	it "Returns false if the user is not logged in" do
  		alice = Fabricate(:user)
  		expect(logged_in?).to eq(false)
  	end
  end

  describe "#log_out" do
    it "deletes the session user_id" do
      session[:user_id] = 1
      log_out
      expect(session[:user_id]).to eq(nil)
    end

    it "sets the current user to nil" do
      @current_user = 1
      log_out
      expect(@current_user).to be_nil
    end
  end

end
