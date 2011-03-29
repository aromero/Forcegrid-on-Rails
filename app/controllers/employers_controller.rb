class EmployersController < ApplicationController
  def show
    @employer = Employer.find(params[:id])
  end

  def new
    @employer = Employer.new
    @employer.jobs.build
  end

  def create
    unless current_user
      session[:employer] = Employer.new params[:employer]
      flash[:notice] = 'Please sign-in to let us know who you are.'
      redirect_to new_user_session_path
    else
      render :action => 'new'
    end
  end
end
