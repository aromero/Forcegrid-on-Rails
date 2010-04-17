class WorkersController < ApplicationController
  def index
    @workers = Worker.all
  end

  def show
    @worker = Worker.find(params[:id])
  end

  def new
    @worker = Worker.new
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def create
    @worker = Worker.new(params[:worker])

    respond_to do |format|
      if @worker.save
        flash[:notice] = 'Worker was successfully created.'
        redirect_to(@worker)
      else
        render :action => "new"
      end
    end
  end

  def update
    @worker = Worker.find(params[:id])

    respond_to do |format|
      if @worker.update_attributes(params[:worker])
        flash[:notice] = 'Worker was successfully updated.'
        redirect_to(@worker)
      else
        render :action => "edit"
      end
    end
  end

  def destroy
    @worker = Worker.find(params[:id])
    @worker.destroy

    redirect_to(workers_url)
  end
end
