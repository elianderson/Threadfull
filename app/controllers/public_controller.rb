class PublicController < ApplicationController
  before_filter :load_categories

  def index
    @products = Product.all
  end

  def category
    @category = params[:category]
    @products = Product.where(:category => @category)
  end

  def product
    pro = params[:product]
    category = params[:category]
    @product = Product.where(:category => category,:id => pro).first()
  end

  private
  
  def load_categories
    @categories = Category.all
  end

end
