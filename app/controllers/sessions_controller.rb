class SessionsController < ApplicationController
  def new
  end

  def create
    staff = Staff.find_by(email: params[:session][:email].downcase)
    if staff && staff.authenticate(params[:session][:password])
      redirect_to('/users')
    else
      render 'new'
    end
  end

  def destroy
  end
end
