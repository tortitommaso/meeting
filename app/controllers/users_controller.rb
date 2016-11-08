class UsersController < ApplicationController
  def index
    @users = UserRepository.instance.all
    @deleted_users = UserRepository.instance.deleted_users
  end

  def create
    begin
      user_name = params.require("name")
      user = User.new(name: user_name)
      UserRepository.instance.add(user)
      flash[:success] = "User #{user_name} added"
    rescue ActionController::ParameterMissing => e
      flash[:error] = "Please insert name"
    end
    redirect_to action: :index
  end

  def destroy
    begin
      user_name = params.require("id")
      UserRepository.instance.remove(user_name)
      flash[:success] = "User #{user_name} deleted"
    rescue ActionController::ParameterMissing => e
      flash[:error] = "Cannot delete user"
    end

    redirect_to action: :index
  end

  def draw
    @user = UserRepository.instance.all.sample
  end

end