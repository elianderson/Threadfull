class PublicController < ApplicationController

  def index
    @products = Product.all
    @categories = Category.all
  end

  def category
    category = params[:category]
    @products = Product.where(:category => category)
  end

  def product
    pro = params[:product]
    category = params[:category]
    @product = Product.where(:category => category,:id => pro).first()
  end

end
