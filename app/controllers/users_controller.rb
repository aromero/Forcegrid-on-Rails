class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    case params[:type]
    when 'employer'
      @employer = Employer.new
      @user = @employer.build_user
    when 'worker'
      @worker = Worker.new
      @user = @worker.build_user
      10.times { @worker.skill_workers.build }
    end
  end
  
  def create
    @owner = Employer.new(params[:employer]) if params[:employer]
    if params[:worker]
      @owner = Worker.new(params[:worker])
      debugger
    end
    @owner.save
    
    @user = User.new(params[:user])
    @user.owner = @owner
    
    if @user.save_without_session_maintenance
      @user.deliver_activation_instructions!
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_to root_path
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Cuenta actualizada"
      redirect_to account_url
    else
      render :action => :edit
    end
  end
end