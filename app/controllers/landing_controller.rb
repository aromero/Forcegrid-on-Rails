class LandingController < ApplicationController
  layout 'landing'
  def index
    #@jobs = Job.current.find(:all, :include => :category).group_by(&:category)
    @jobs = Job.joins(:category).group_by(&:category)
  end
end