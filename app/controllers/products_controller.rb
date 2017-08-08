class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.where(id: params[:id]).first
    respond_to do |format|
      format.js
      format.html
    end
  end

  def add_to_cart

  end

end
