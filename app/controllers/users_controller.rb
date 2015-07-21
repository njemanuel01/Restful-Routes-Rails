class UsersController < ApplicationController
  def list
    @users = User.all
  end
  
  def new_form
    @user = User.new
  end
  
  def new_form_do
    user_params = params.require(:users).permit(:email, :password)
    
    @user = User.new(user_params)
    if @user.save
      redirect_to "/users/#{@user.id}"
    else
      render :"users/new_form"
    end
  end
  
  def delete_form
    @user = User.find(params["id"])
  end
  
  def delete_form_do
    @user = User.find(params["id"])
    if @user.delete
      redirect_to "/users"
    else
      render :"users/delete_form"
    end
  end
  
  def edit_form
    @user = User.find(params["id"])
  end
  
  def edit_form_do
    @user = User.find(parms["id"])
  end
  
  def single
    @user = User.find(params["id"])
  end
end
