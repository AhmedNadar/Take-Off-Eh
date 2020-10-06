# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)

    user ||= User.new # guest user (not logged in)
    can :read, :all # permissions for every user, even if not logged in

    if user.present?  # additional permissions for logged in users (they can manage their posts)
      if user.has_role? :admin
        can :manage, :all
        # - user authorize -
        can [:delete, :show, :edit, :update, :create, :index, :destroy_multiple], User
        can :destroy, User do |u| !u.eql?(user) end  

      else user.has_role? :client
        # user authorize
        can :manage, Company, user_id: user.id 
        can :manage, Job, user_id: user.id
      end
    end
  end
end




# # frozen_string_literal: true
# class Ability
#   include CanCan::Ability

#   def initialize(user)
#     user ||= User.new # guest user (not logged in)
#     can :read, :all # permissions for every user, even if not logged in

#     if user.has_role? :admin
#       can :manage, :all
#       # - user authorize -
#       can [:delete, :show, :edit, :update, :create, :index, :destroy_multiple], User
#       can :destroy, User do |u| !u.eql?(user) end

#     else user.has_role? :client
#       # - user authorize -
#       can :read, Company
#       can :update, Company, user_id: user.id # additional permissions for logged in users (they can manage their posts)
#       can :destroy, Company, user_id: user.id # additional permissions for logged in users (they can manage their posts)
#       can :create, Company, user_id: user.id # additional permissions for logged in users (they can manage their posts)
#       can :edit, User, user_id: user.id # logged in users can also update it's account      
#     end

#     # if user.has_role? :client
#     #   can :manage, Company, user_id: user.id # additional permissions for logged in users (they can manage their posts)
#     #   can :read, Company, user_id: user.id # logged in users can also create company
#     #   can :update, User, user_id: user.id # logged in users can also update it's account
#     # end
#     # if user.has_role? :admin
#     #   can :manage, :all # finally we give all remaining permissions only to the admins
#     # end
#   end
# end