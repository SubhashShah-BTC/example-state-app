class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.agent?
      can :manage, Property, owner_id: user.id
      can :manage, Address, property: { id: user.property_ids }
    elsif user.customer?
      can :manage, Property, owner_id: user.id
      can :manage, Address, property: { id: user.property_ids }
    else
      can :read, Property
    end
  end
end
