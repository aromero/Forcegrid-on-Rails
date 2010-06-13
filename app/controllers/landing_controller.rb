class LandingController < ApplicationController
  layout 'landing'
  def index
    if current_user && current_user.employer?
      @jobs = current_user.owner.jobs
    else
      @jobs = Job.current
    end
  end
end