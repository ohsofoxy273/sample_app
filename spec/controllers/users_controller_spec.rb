require 'spec_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "sets the @user variable" do
      alice = Fabricate(:user)
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe "GET show" do
  	it "returns http success" do
  		get :show, id: Fabricate(:user).id
  		expect(response).to have_http_status(:success)
    end
  end

  describe "POST create" do
    context "with valid input" do

      it "creates a new user" do
        alice = Fabricate.attributes_for(:user)
        post :create, user: alice
        expect(User.count).to eq(1)
      end

      it "logs in the user" do
        alice = Fabricate.attributes_for(:user)
        post :create, user: alice
        expect(session[:user_id]).to eq(1)
      end

      it "shows the flash" do
        alice = Fabricate.attributes_for(:user)
        post :create, user: alice
        expect(flash[:success]).to be_present
      end

      it "redirects to the user's show page" do
        alice = Fabricate.attributes_for(:user, id: 1)
        post :create, user: alice
        expect(response).to redirect_to user_path(alice[:id])
      end
    end

    context "with invalid input" do

      it "sets the @user variable" do
        alice = Fabricate.attributes_for(:user)
        post :create, user: { alice: {password: ""}}
        expect(assigns(:user)).to be_instance_of(User)
      end

      it "renders the 'new' template" do
        alice = Fabricate.attributes_for(:user)
        post :create, user: { alice: {password: ""}}
        expect(response).to render_template(:new)
      end

      it "doesn't create a user" do
        alice = Fabricate.attributes_for(:user)
        post :create, user: { alice: {password: ""}}
        expect(User.count).to eq(0)
      end
    end 
  end

end