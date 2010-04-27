class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      if user.employer?
        can :create, Job
        can :update, Job do |job|
          job.try(:employer) == user.owner && job.draft?
        end
        can :publish, Job do |job|
          job.try(:employer) == user.owner
        end
      end
      if user.worker?
        can :create, Bid
      end
      can :read, Job
    end
  end
end