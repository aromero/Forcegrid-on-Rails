class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    @user = User.new
    @user.build_employer if params[:type] == 'employer'
    if params[:type] == 'worker'
      worker = @user.build_worker
      10.times { worker.skill_workers.build }
    end
  end
  
  def create
    @user = User.new(params[:user])
    
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
  
  def add_skills
    
  end
end