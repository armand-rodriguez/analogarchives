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
      @products = Product.where("artist LIKE ?", "%#{search_term}%").or(Product.where("album LIKE ?", "%#{search_term}%"))
      # this one next one with the .or you can probably delete
      # @articles = Article.where("title LIKE ? ", "%#{search_term}%").or(Article.where("description LIKE ?", "%#{search_term}%")).or(Article.where("body LIKE ?", "%#{search_term}%"))
      @articles = Article.where("title LIKE ? OR description LIKE ? OR body LIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%" )

    end
  end
  def about

  end
  def landing

  end
end
