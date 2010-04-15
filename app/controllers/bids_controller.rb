class BidsController < ApplicationController
  def index
    @bids = Bid.all
  end

  def show
    @bid = Bid.find(params[:id])
  end

  def new
    @bid = Bid.new
    flash[:notice] = "If you are registered, please login. If not, please fill in this form."
    redirect_to new_account_path(:type => 'worker') unless can? :create, Bid
  end

  def edit
    @bid = Bid.find(params[:id])
  end

  def create
    @bid = Bid.new(params[:bid])
  end

  def update
    @bid = Bid.find(params[:id])
  end

  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy
  end
end
