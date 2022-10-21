module SessionHelper

  # Save user_id to session when user log in
  def log_in(user)
    session[:user_id] = user.id
  end

  # Return current user is logged in if user existed!
  def current_user 
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    end
  end

  # Remove user_id in session when user log out
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Check user is logged in or not not?
  def logged_in?
    !current_user.nil?
  end

  # Check user is action in user's account or not.
  def current_user?(user)
    user && user == current_user
  end
  
end