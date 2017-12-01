class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end

    if user.writer?
      can :manage, User, id: user.id
    end

    if user.reader?
      can :read, Feed
      can :manage, Comments, user_id: user.id
    end
  end
end
