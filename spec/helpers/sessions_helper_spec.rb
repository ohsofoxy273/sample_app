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
  		alice = Fabricate(:user)
      log_in(alice)
  		expect(current_user).to eq(alice)
  	end

  	it "sets the current user if one is not present" do
  		alice = Fabricate(:user)
  		log_in(alice)
  		expect(current_user).to eq(alice)  		
  	end

    it "returns nil when remember digest is wrong" do
      alice = Fabricate(:user)
      alice.update_attribute(:remember_digest, User.digest(User.new_token))
      expect(current_user).to be_nil
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
      alice = Fabricate(:user)
      session[:user_id] = alice.id
      log_out
      expect(session[:user_id]).to eq(nil)
    end

    it "sets the current user to nil" do
      alice = Fabricate(:user)
      session[:user_id] = alice.id
      log_out
      expect(current_user).to be_nil
    end
  end

  describe "#remember" do
    it "stores the cookie's user_id as the user's id" do
      alice = Fabricate(:user)
      remember(alice)
      expect(cookies.permanent.signed[:user_id]).to eq(alice.id)
    end
  end

  describe "#forget" do
    it "changes the user's remember_digest to nil" do
      alice = Fabricate(:user)
      alice.remember_digest = "14"
      forget(alice)
      expect(alice.remember_digest).to be_nil
    end
  end
end
