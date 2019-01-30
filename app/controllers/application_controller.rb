class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CurrentCart
  before_action :current_or_guest_user
  before_action :set_cart
  before_action :first_time_visit, unless: -> { cookies[:first_visit] }
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to articles_path, alert: exception.message
  end


  def current_or_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        logging_in
        # reload guest_user to prevent caching problems before destruction
        guest_user(with_retry = false).try(:reload).try(:destroy)
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  def guest_user(with_retry = true)
   # Cache the value the first time it's gotten.
   @cached_guest_user ||= User.find(session[:guest_user_id] ||= create_guest_user.id)

   rescue ActiveRecord::RecordNotFound # if session[:guest_user_id] invalid
    session[:guest_user_id] = nil
    guest_user if with_retry
  end



  def first_time_visit
     cookies.permanent[:first_visit] = 1
     @first_visit = true
  end

  private

  def logging_in
    # For example:
    # guest_comments = guest_user.comments.all
    # guest_comments.each do |comment|
      # comment.user_id = current_user.id
      # comment.save!
    # end
  end

  def create_guest_user
    u = User.new(:first_name => "guest_first", :last_name => "guest_last", :email => "guest_#{Time.now.to_i}#{rand(100)}@example.com")
    u.save!(:validate => false)
    session[:guest_user_id] = u.id
    u
  end

end
