class StaffsController < ApplicationController
  # setting default staff, based on the id
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  # check if staff has already logged in
  # before_action :require_login, only: [:index, :show, :edit, :update, :destroy]

  # check if correct staff
  before_action :correct_staff, only: [:show, :edit, :update, :destroy]
  #
  # check if needs log out again
  before_action :require_logout, only: [:new]


  # GET /staffs
  # GET /staffs.json
  def index
    @staff = Staff.all
  end

  # GET /staffs/1
  # GET /staffs/1.json
  def show
    @staff = Staff.exists?(params[:id])
    if @staff
      @staff = Staff.find(params[:id])
    else
      flash[:danger] = 'Staff does not exist.'
    end
  end

  # GET /staffs/new
  def new
    @staff = Staff.new
  end

  # GET /staffs/1/edit
  def edit
  end

  # POST /staffs
  # POST /staffs.json
  def create
    @staff = Staff.new(staff_params)

    respond_to do |format|
      if @staff.save
        log_in @staff
        format.html { redirect_to @staff, notice: 'Staff was successfully created.' }
        format.json { render :show, status: :created, location: @staff }
      else
        format.html { render :new }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffs/1
  # PATCH/PUT /staffs/1.json
  def update
    respond_to do |format|
      if @staff.update(staff_params)
        format.html { redirect_to @staff, notice: 'Staff was successfully updated.' }
        format.json { render :show, status: :ok, location: @staff }
      else
        format.html { render :edit }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffs/1
  # DELETE /staffs/1.json
  def destroy
    @staff.destroy
    respond_to do |format|
      format.html { redirect_to staffs_url, notice: 'Staff was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def staff_params
    params.require(:staff).permit(:name, :email, :password, :password_confirmation)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_staff
    @staff = Staff.find_by(params[:id])
  end

  # def require_login
  #   #check if the user is logged in or not
  #   unless logged_in?
  #     flash[:danger] = "Log in for access"
  #     redirect_to root_url # halts request cycle
  #   end
  # end

  # Confirms the correct staff.
  def correct_staff
    @staff = Staff.find_by(params[:id])
  #  @currentstaff = Staff.find_by(id: session[:staff_id])
    unless current_staff?(@staff)
      flash[:warning] = "You have no access."
      redirect_back_or( root_url )
    end
  end
  #
  def require_logout
    if logged_in?
      flash[:warning] = "You must be logged out to create a new user"
      redirect_to(root_url)
    end
  end

end
