module SessionsHelper

  def log_in(staff)
    session[:staff_id] = staff.id
  end

  def current_staff
    @current_staff ||= Staff.find_by(id: session[:staff_id])
  end
end
