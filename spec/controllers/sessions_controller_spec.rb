require 'spec_helper'

describe SessionsController do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create' do
  	context "with valid session information" do 
 
	  	it "logs in the user" do
	  		alice = Fabricate(:user)
	  		post :create, {session: {email: alice.email, password: alice.password}}
	  		expect(session[:user_id]).to eq(alice.id)
	  	end

	  	it "redirects to the user's show page" do
	  		alice = Fabricate(:user)
	  		post :create, {session: {email: alice.email, password: alice.password}}
	  		expect(response).to redirect_to(user_path(alice.id))
	  	end
	  end

  	context "with invalid session information" do
	  	before do
	  		alice = Fabricate(:user)
	  		post :create, {session: {email: alice.email, password: "wrong"}}
	  	end

	  	it "does not log in the user" do
	  		alice = Fabricate(:user)
	  		post :create, {session: {email: alice.email, password: "wrong"}}
	  		expect(session[:user_id]).to be_nil
	  	end

	  	it "flashes a warning" do
	  		expect(flash[:danger]).to eq('Invalid email/password combination')
	  	end

	  	it "renders 'new' template" do
	  		expect(response).to render_template(:new)
	  	end
  	end 
  end

  describe "DELETE destroy" do
    it "logs out the user" do
      alice = Fabricate(:user)
      session[:user_id] = alice.id
      get :destroy
      expect(session[:user_id]).to eq(nil)
    end

    it "redirects to the home page" do
      alice = Fabricate(:user)
      session[:user_id] = alice.id
      get :destroy
      expect(response).to redirect_to root_path
    end
  end

end