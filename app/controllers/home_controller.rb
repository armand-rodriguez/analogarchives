class HomeController < ApplicationController
  def index
  end
  def contact
  end
  def thank_you

    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

  def search

    if params[:q]
      search_term = params[:q]
      @products = Product.where("artist LIKE ?", "%#{search_term}%")
      @articles = Article.where("title LIKE ?", "%#{search_term}%")
    
    end
  end
end
