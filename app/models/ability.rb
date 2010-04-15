class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      if user.employer?
        can :create, Job
        can :update, Job do |job|
          job.try(:employer) == user.owner
        end
      end
      if user.worker?
        can :create, Bid
      end
    end
  end
end