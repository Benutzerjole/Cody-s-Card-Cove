class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_cart

  def index
    @cart = session[:cart]
    @provinces = Province.all
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart][id] = 1
    flash[:notice] = "Item successfully added to cart."
    redirect_to(request.env['HTTP_REFERER'])
  end

  def remove_from_cart
    id = params[:id].to_s
    session[:cart].delete(id)
    flash[:notice] = "Item successfully deleted from cart."
    redirect_to cart_path
  end

  def modify_cart_quantity
    id = params[:id].to_s
    print(params[:quantity])
    session[:cart][id] = params[:quantity].to_i
    flash[:notice] = "Item quantity modified."
    redirect_to cart_path
  end

  def initialize_cart
    session[:cart] ||= {}
  end
end
