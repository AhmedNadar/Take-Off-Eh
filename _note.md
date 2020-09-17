# Installation and setup

### friendly_id [https://github.com/norman/friendly_id]

  - `gem 'friendly_id', '~> 5.4.0'`
  - bundle install
  - rails g migration AddSlugToUsers slug:uniq (Users or other model)
  - rails generate friendly_id
  - rails db:migrate
  - Edit the `app/models/user.rb` file as the following:
    `class User < ApplicationRecord`
      `extend FriendlyId`
      `friendly_id :name, use: :slugged`
    `end`
  - Edit the app/controllers/users_controller.rb file and replace User.find by User.friendly.find
      `class UserController < ApplicationController`
        `def show`
          `@user = User.friendly.find(params[:id])`
        `end`
      `end`


### CanCanCan [https://github.com/CanCanCommunity/cancancan]

  - gem 'cancancan'
  - `rails g cancan:ability`
  - `class Ability`
      `include CanCan::Ability`

      `def initialize(user)`
      `can :read, Post, public: true`

      `if user.present?  # additional permissions for logged in users (they can read their own posts)`
        `can :read, Post, user_id: user.id`

        `if user.admin?  # additional permissions for administrators`
          `can :read, Post`
        `end`
      `end`

      `end`
    `end`

  #### Check Abilities
    - The current user's permissions can then be checked using the can? and cannot? methods in views and controllers.

      `<% if can? :read, @post %>`
        `<%= link_to "View", @post %>`
      `<% end %>`

  #### Fetching records
    - One of the key features of CanCanCan, compared to other authorization libraries, is the possibility to retrieve all the objects that the user is authorized to access. The following:
      `Post.accessible_by(current_ability)`


### rolify [https://github.com/RolifyCommunity/rolify]
  - `gem "rolify"`
  - `rake db:migrate`
  - Assign default role
    `after_create :assign_default_role`

    `def assign_default_role`
      `self.add_role(:newuser) if self.roles.blank?`
    `end`


### annotate_models [https://github.com/ctran/annotate_models]

  - `group :development do`
      `gem 'annotate'`
    `end`
  - `gem install annotate`
  - `rails g annotate:install`
  - cd /path/to/app
      `annotate`, `annotate --models --exclude fixtures`, `annotate --models`, `annotate --routes`, `annotate --delete`, `annotate --routes --delete`
  - Update `lib/tasks/auto_annotate_models.rake` file.

### responders [https://github.com/heartcombo/responders]
  - `gem 'friendly_id', '~> 5.4.0'`
  - `bundle install`
  - `rails g responders:install`

### inline_svg [https://github.com/jamesmartin/inline_svg]

  - `gem 'inline_svg'`
  - `bundle`

  #### Usage
    - Sprockets
        `inline_svg_tag(file_name, options={})`
    - Webpacker
        `inline_svg_pack_tag(file_name, options={})`


### rubocop [https://github.com/rubocop-hq/rubocop]

  - `gem 'rubocop', require: false`
  
  #### Quickstart
    Just type rubocop in a Ruby project's folder and watch the magic happen.
      `$ cd my/cool/ruby/project`
      `$ rubocop`


### paper_trail [https://github.com/paper-trail-gem/paper_trail]

  - `gem 'paper_trail'`
  
  #### Add a `versions` table to your database:
    - `bundle exec rails generate paper_trail:install [--with-changes]`


  #### Add `has_paper_trail` to the models you want to track.
    `class User < ActiveRecord::Base`
      `has_paper_trail`
    `end`
  #### If your controllers have a `current_user` method, you can easily track who is responsible for changes by adding a controller callback.
    `class ApplicationController`
      `before_action :set_paper_trail_whodunnit`
    `end`
