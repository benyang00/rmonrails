class SessionsController < ApplicationController
  def new
  end

  def create
    staff = Staff.find_by(email: params[:session][:email].downcase)
    if staff && staff.authenticate(params[:session][:password])
      log_in staff
      flash[:success] = 'Login successful!'
      redirect_to('/users')
    else
      flash.now[:danger] = 'Invalid email/password combination!'
      render 'new'
    end
  end

  def destroy
  end
end
