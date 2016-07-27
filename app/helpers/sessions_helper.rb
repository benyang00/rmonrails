module SessionsHelper

  def log_in(staff)
    session[:user_id] = user.id
  end

end
