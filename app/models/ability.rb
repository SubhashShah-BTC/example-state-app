class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      cannot :purchase, Property
      can :manage, :all
    elsif user.agent?
      can :read, Property
      can :manage, Property, owner_id: user.id
      can :manage, Address, property: { id: user.property_ids }
      can :purchase, Property, id: User.where.not(id: user.id).map(&:property_ids).flatten
    elsif user.customer?
      can :read, Property
      can :manage, Property, owner_id: user.id
      can :manage, Address, property: { id: user.property_ids }
      can :purchase, Property, id: User.where.not(id: user.id).map(&:property_ids).flatten
    else
      can :read, Property
    end
  end
end
