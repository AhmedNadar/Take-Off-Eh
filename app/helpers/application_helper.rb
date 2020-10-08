require 'navigation_helper.rb'

module ApplicationHelper
include NavigationHelper

  def full_title(page_title = '')
    base_title = "Take Off Eh!"
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  # how to use it
  # check [layouts/application.html.erb]
  def active_class(link_path)
    active = current_page?(link_path) ? "active" : "no-active"
  end

  def current_path(path)
    current = current_page?(path) ? "current-page" : ""
  end  

  # def gravatar_for(user)
  #   if user.email?
  #       gravatar_id  = Digest::MD5::hexdigest(user.email.downcase)
  #       gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=200"
  #   else
  #       "../assets/medium-default-avatar.png"
  #   end
  # end


  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=40"

    # if user.image
    #   user.image
    # else
    #   gravatar_url
    # end
  end



  # readable time
  def readable_time(time)
    time.strftime("%b %d, %I:%M%P")
  end

  def author_of(resource)
    user_signed_in? && resource.user_id == current_user.id
  end

  def meta_author
    "Ahmed Nadar"
  end

  def meta_description
    "Built In Toronto is the online community for Toronto startups and tech companies. Find startup jobs, tech news and events."
  end

  def meta_keywords
    "Toronto, Startup, tech companies"
  end

  def site_url
    if Rails.env.production?
      # Place production URL
      "http://builtintoronto.org/"
    else
      # Our dev & test URL.
      "http://localhost:3000"
    end
  end
  
end
