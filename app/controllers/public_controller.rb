class PublicController < ApplicationController
  before_filter :load_categories

  def index
    @products = Product.all
  end

  def category
    @category = params[:category]
    @category_name = (params[:category]).to_s.gsub('-', ' ')
    @products = Product.where(:category => @category)
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

  private
  
  def load_categories
    @categories = Category.all
  end

end

