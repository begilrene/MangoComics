module SessionsHelper
  def log_in(user)
    session[:userID] = user.userID
  end
  def current_user
   @current_user = user.find_by(userID: session[:userID])
  end
  def logged_in?
    !current_user.nil?
  end
  def log_out
    @current_user = nil
    session.delete(:userID)
    #@current_user = nil
  end
end
