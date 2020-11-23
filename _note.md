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

### SitemapGenerator [https://github.com/kjvarga/sitemap_generator#rails]
  - `gem 'sitemap_generator'`

  #### Rake Tasks
  - `rake sitemap:install` will create a `config/sitemap.rb` file which is your sitemap configuration and contains everything needed to build your sitemap.










========================


## Articles and sites for examples and code

  - [Rails 5.2 and Active Storage - the new approach to file uploads](https://prograils.com/posts/rails-5-2-active-storage-new-approach-to-file-uploads)
  - [Youtube for examples and features](https://www.youtube.com/c/Deanin/videos)
  - [Tailwind for CSS](https://tailwindcss.com/)
  - [Examples and gems list](https://briansigafoos.com/rails-gists/)
  - [Rails, Devise, CanCan, Rolify and User Company Role](https://coderwall.com/p/eudimq/rails-devise-cancan-rolify-and-user-company-role)
  - [Markdown syntax](https://www.markdownguide.org/basic-syntax)
  - [Rails 5.2: Active Storage and beyond](https://evilmartians.com/chronicles/rails-5-2-active-storage-and-beyond)
  - [Eager Loading/Querying Against ActiveStorage Attachments](https://jasoncharnes.com/eager-loading-querying-against-activestorage-attachments/)




### Process
- add investor account attributes
  `rails g scaffold Investor name website type_of_investor estimated_funding startup_stages industry business_model investable_regions user:references`

## Models

#### UserModel
- name(first and last), email , user_name, password
- has_many :companies
- has_many :jobs
- has_many :contacts
- has_many :team_members

#### InvestorModel
- user_id, company_name, type_of_investor, geographical_focus, sectors_invested_in, preferred_investment_stage,
- estimated_funding, startup_stages, industry, mission, description, photo,
- funds_to_invest, active > default: true, 
- has_many :contacts
- has_many :funds
- belongs_to :user


#### FundModel
- investor_id, geographical_focus, funding_amount, funds_needed, sector,   

#### ContactModel
- phone, address, twitter, instagram, linked_in, facebook, skype, angellist, website, 

#### CompanyModel
- user_id, name , description, url,business_model, company_size, email, found_date, 
- headquarter, industry, phone_number, slug, stage, website, 

#### JobModel
- user_id, company_id, title, category, company_statement, featured, featured_until, job_type,
- link_to_apply, price, published_at, region, remote

#### TeamMemberModel
- user_id, company_id, email, first_name, last_name, profile_link, title, 





- Custom Date And Time Formats In Rails
- https://thoughtbot.com/blog/custom-date-and-time-formats-in-rails


Making a Rails 6 app in 2020
https://dev.to/majov84382672/making-a-rails-6-app-in-2020-3fng
