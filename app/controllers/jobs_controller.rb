class JobsController < ApplicationController  
  def index
    if params[:search]
      @jobs = Job.search(params[:search])
    else
      @jobs = Job.current
    end
  end

  def show
    @job = Job.find(params[:id], :include => [:employer, :category])
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    unless current_user
      @job = Job.new(params[:job])
      flash[:notice] = 'Please sign-in to let us know who you are.'
      session[:job] = @job
      redirect_to new_user_session_path
    end
    
    # if @job.save
    #   flash[:notice] = 'Job was successfully created.'
    #   redirect_to(@job)
    # else
    #   render :action => "new"
    # end
  end

  def update
    @job = Job.find(params[:id])
    
    if @job.update_attributes(params[:job])
      flash[:notice] = 'Job was successfully updated.'
      redirect_to @job
    else
      render :action => "edit"
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to jobs_url
  end
  
  def publish
    @job = Job.find(params[:id])
    if @job.publish
      flash[:notice] = 'Job published successfully'
      redirect_to root_url
    end
  end
end
