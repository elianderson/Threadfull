class PublicController < ApplicationController
  before_filter :load_categories, :match_category

  def index
    @products = Product.all
  end

  def category
    @category_name = (params[:category]).to_s.gsub('-', ' ').gsub(' 5', ' $5')
    @products = Product.where(:category => @category).order("'updated_at' ASC")
  end

  def product
    pro = params[:product]
    @category_name = (params[:category]).to_s.gsub('-', ' ')
    @product = Product.where(:category => @category,:id => pro).first()
    @related_products = Product.where("category = ? AND id != ?",@category, pro).order("random()").limit(3)
  end

  def feed
    @products = Product.all
    
    respond_to do |format|
      format.rss { render :xml => @products, :layout => false }
    end
  end
  def error
    @products = Product.all
  end
  private
  
  def load_categories
    @categories = Category.all
  end
  
  def match_category
    if(params[:category])
    if (Category.check_category(params[:category]))
      @category = params[:category]
    else
      redirect_to "/404.html"
    end
    end
  end

end

