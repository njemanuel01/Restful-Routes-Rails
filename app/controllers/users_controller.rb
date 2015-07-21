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
  
  def single
    @user = User.find(params["id"])
  end
end
