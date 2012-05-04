class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user

    if user.role? :administrator
      can :manage, :all
    elsif user.role? :member
      can :manage, TodoList
    else 
      can :read, :all
    end
  end
end