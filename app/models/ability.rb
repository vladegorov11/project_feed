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
      can :new, Feed
      can :create, Feed
      #can :manage, Feed, user_id: user.id
      can :manage, User, id: user.id
      can :manage, Comment, user_id: user.id
    end

    if user.reader?
      can :manage, User, id: user.id
      can :read, Feed
      can :manage, Comment, user_id: user.id
    end
  end
end
