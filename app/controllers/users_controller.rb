class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  #layout 'two_col', :only => [:new]
  def new
    render :action => :choose
  end
  
  def worker_signup
    @worker = Worker.new
    10.times { @worker.skill_workers.build }
    @user = @worker.build_user
  end
  
  def employer_signup
    @employer = Employer.new
    @user = @employer.build_user
  end
  
  def create
    @owner = Employer.new(params[:employer]) if params[:employer]
    @owner = Worker.new(params[:worker]) if params[:worker]
    @owner.save
    
    @user = User.new(params[:user])
    @user.owner = @owner
    
    if @user.save_without_session_maintenance
      @user.deliver_activation_instructions!
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!"
      redirect_to root_path
    else
      render :action => :worker_signup if params[:worker]
      render :action => :employer_signup if params[:employer]
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
  
  def choose
  end
end