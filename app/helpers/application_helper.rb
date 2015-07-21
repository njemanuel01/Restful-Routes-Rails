module ApplicationHelper
  # sets the current user or redirects to the login screen
  #
  # returns the current user or redirects
  def current_user
    if session[:id]
      @user = User.find(session[:id].to_i)
    else
      session.clear
      redirect "/"
    end  
  end
end
