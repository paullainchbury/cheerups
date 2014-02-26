class Ability
  include CanCan::Ability

def initialize(user)
    user ||= User.new
    if user.role? :admin
        can :manage, :all
        can :flagged_cheerups, Cheerup
        # can :ignore_flagged, Cheerup
    elsif user.role? :user
        can :manage, Cheerup do |cheerup|
             cheerup.try(:user) == user
        end
        can :manage, User do |user_profile|
            user_profile == user
        end
        can :read, :all
        can :create, Cheerup
        can :flag, Cheerup
        can :vote, Cheerup
        cannot :flagged_cheerups, Cheerup

    else
        can :create, User
        can :read, :all
    end
    cannot :delete, User do |target_user|
        user == target_user
    end
end

end









