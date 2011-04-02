class WorkersController < ApplicationController
  def show
    @worker = Worker.find(params[:id])
  end

  def new
    @worker = Worker.new
  end
  
  def create
    unless current_user
      session[:worker] = Worker.new params[:worker]
      flash[:notice] = 'Please sign-in to let us know who you are.'
      redirect_to new_user_session_path
    else
      render :action => 'new'
    end
  end
end
