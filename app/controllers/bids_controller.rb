class BidsController < ApplicationController
  def index
    @bids = Bid.all
  end

  def show
    @bid = Bid.find(params[:id])
  end

  def new
    @bid = Bid.new
    unless can? :create, Bid
      flash[:notice] = "If you are registered, please login. If not, please fill in this form."
      redirect_to new_account_path(:type => 'worker')
    end
  end

  def edit
    @bid = Bid.find(params[:id])
  end

  def create
    @bid = Bid.new(params[:bid])
    
    if @bid.save
      flash[:notice] = 'You have just created a new Bid for this Job'
      redirect_to(@bid.job)
    else
      render :action => "new"
    end
  end

  def update
    @bid = Bid.find(params[:id])
  end

  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy
  end
end
