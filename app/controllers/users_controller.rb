class UsersController < ApplicationController
  
  def login
    session.clear
    @user = User.new
  end
  
  def check_login
    @user = User.where("email" => params["users"]["email"]).first
    if !@user.nil? && @user.valid_password?(params["users"]["password"])
      session[:id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      render :"users/login"
    end
  end
  
  def list
    @users = User.all
  end
  
  def new_form
    @user = User.new
  end
  
  def new_form_do
    params["users"]["password"] = BCrypt::Password.create(params["users"]["password"])
    @user = User.new(params["users"])
    if @user.valid?
      @user.save
      session[:id] = @user.id
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
    @user = User.find(params["id"])
    if @user.update(params["users"].permit(:email, :password))
      redirect_to "/users/#{@user.id}"
    else
      render :"users/edit_form"
    end
  end
  
  def single
    @user = User.find(params["id"])
  end
end
