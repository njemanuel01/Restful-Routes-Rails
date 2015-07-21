class UsersController < ApplicationController
  def list
    @users = User.all
  end
  
  def new_form
  end
  
  def new_form_do
    @user = User.new(params["users"])
    if @user.save
      redirect "/users/#{@user.id}"
    end
  end
  
  def single
    @user = User.find(params["id"])
  end
end
