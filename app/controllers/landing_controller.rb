class LandingController < ApplicationController
  def index
    if current_user && current_user.employer?
      @jobs = current_user.owner.jobs
    else
      @jobs = Job.current
    end
  end
  
  def register
  end
end