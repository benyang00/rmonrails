module SessionsHelper

  #Logs staff in
  def log_in(staff)
    session[:staff_id] = staff.id
  end

  #Returns current logged in staff, if any
  def current_staff
    @current_staff ||= Staff.find_by(id: session[:staff_id])
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  #Check if passed staff is current staff
  def current_staff?(staff)
    staff == current_staff
  end

  #Returns true if user is logged in, false otherwise
  def logged_in?
    !current_staff.nil?
  end

  #Logs current staff out
  def log_out
    session.delete(:staff_id)
    @current_staff = nil
  end

end
