class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    alias_action :create, :read, :update, :destroy, to: :crud
    p user
    if user.role == "Campus Director"
      can :manage, :all
    elsif user.role == "Instructor/TA"
      can :crud, Project
      can :crud, :transmits
      can :crud, :comments
      can :reviewed, :transmits
      can :completed, :transmits
      can :unsatisfactory, :transmits
    else user.role == "Student"
      can :crud, :transmits
      can :crud, :comments
    end
  end
end