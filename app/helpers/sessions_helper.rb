module SessionsHelper

  def sign_in(user)
    session[:current_user_id] = user.id
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    if session[:current_user_id]
      @current_user ||= User.find(session[:current_user_id])
    end
  end

  def current_user?(user)
    user == current_user
  end

  def sign_out
    self.current_user = nil
    session[:current_user_id] = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
end
