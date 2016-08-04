class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :require_login, only: [:index, :show, :edit, :update, :destroy]

  private

  def require_login
    #check if the user is logged in or not
    unless logged_in?
      flash[:danger] = "Log in for access"
      redirect_to root_url # halts request cycle
    end
  end
  
end
