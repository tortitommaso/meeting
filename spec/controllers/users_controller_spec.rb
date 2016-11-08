require 'rails_helper'

RSpec.describe UsersController do
  
  describe "GET index" do
    it "should assigns users and deleted users" do
      get :index
      expect(assigns(:users)).not_to be_empty
      expect(assigns(:deleted_users)).to eq([])
    end
  end

  describe "create" do
    it "should create user" do
      initial_value = UserRepository.instance.all.size
      post :create, {:name =>"new_name"}
      expect(subject).to redirect_to("/users")
      expect(UserRepository.instance.all.size).to eq(initial_value + 1)
    end
  end


end