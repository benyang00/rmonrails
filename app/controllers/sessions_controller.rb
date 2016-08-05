class SessionsController < ApplicationController

  def new
    if logged_in?
      flash[:warning] = 'You are already logged in.'
      redirect_to about_url
    end
  end

  def create

    # if params[:sessions][:login_mtd] == "std"
      staff = Staff.find_by(email: params[:session][:email].downcase)
      if staff && staff.authenticate(params[:session][:password])
        log_in staff
        flash[:success] = 'Login successful!'
        redirect_to staff_url(staff.id)
      else
        flash.now[:danger] = 'Invalid email/password combination!'
        render 'new'
      end
    # else # else if facebook login
    #   auth = request.env["omniauth.auth"]
    #   puts auth
    #   session[:omniauth] = auth.except('extra')
    #   user = User.sign_in_from_omniauth(auth)
    #   session[:user_id] = user.id
    #   redirect_to users_url, notice: "Logged In"
    # end
  end

  def destroy
    # if params[:sessions][:login_mtd] == "std"
      log_out
      redirect_to root_url
    # else
    #   session[:user_id] = nil
    #   session[:omniauth] = nil
    #   redirect_to root_url, notice: "Logged Out"
    # end
  end


end
