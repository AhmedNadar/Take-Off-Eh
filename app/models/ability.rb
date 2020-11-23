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
        can :read, Company, user_id: user.id
        can :manage, Company, user_id: user.id 
        can :read, Job, user_id: user.id
        can :manage, Job, user_id: user.id
        can :read, Event, user_id: user.id
        can :manage, Event, user_id: user.id
        can :read, Blog, user_id: user.id
        can :manage, Blog, user_id: user.id
        cannot :read, :index, :edit, Industry
        cannot :manage, Industry
      end
    end
  end
end



      # user ||= User.new # guest user (not logged in)
      # if user.has_role? :admin
      #   can :manage, :all
      # elsif user.has_role? :staff
      #   can :read, :all
      #   can :update, Talent
      # elsif user.has_role? :recruiter
      #   can :read, Profile, user_id: user.id
      #   can :manage, Profile, user_id: user.id
      #   can :read, Talent
      #   can :read, Company
      #   can :manage, Company
      #   can :manage, BusinessLocation
      #   can :manage, JobRole

      #   # can :manage, BusinessLocation, user_id: user.id
      #   # can :manage, JobPosition, user_id: user.id
      #   # can :read, :create, :update, :destroy, Interview, user_id: user.id
      # else user.has_role? :candidate
      #   can :read, Profile, user_id: user.id
      #   can :manage, Profile, user_id: user.id
      #   can :manage, Talent, user_id: user.id
      #   can :read, Company
      #   can :edit, Talent, user_id: user.id
      #   cannot :index, Talent
      #   # can :read, :update, Interview
      # end