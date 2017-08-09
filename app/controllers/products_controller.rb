class ProductsController < ApplicationController

  #have no idea why form does not send this token, needs investigation, for success work of this I turn protection off
  skip_before_filter :verify_authenticity_token, only: [:add_to_cart]
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
    product = Product.find_by_id(params[:id])
    products_hash = session[:products] || {}
    count = products_hash[product.id.to_s]
    count = count.present? ? count.to_i + 1 : 1
    products_hash[product.id.to_s] = count
    session[:products] = products_hash
    respond_to do |format|
      format.js
    end
  end

  def cart
    #@products = 
  end

end
