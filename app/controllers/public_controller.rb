class PublicController < ApplicationController
  before_filter :load_categories

  def index
    @products = Product.all
  end

  def category
    if (Category.check_category(params[:category]))
      @category = params[:category]
    else
      redirect_to "/404.html"
    end
    # @category = params[:category]
    @category_name = (params[:category]).to_s.gsub('-', ' ')
    @products = Product.where(:category => @category).order("'updated_at' ASC")
  end

  def product
    pro = params[:product]
    @category = params[:category]
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
    
  end
  private
  
  def load_categories
    @categories = Category.all
  end

end

