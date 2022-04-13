class CartController < ApplicationController
  before_action :authenticate_user!
  before_action :initialize_cart

  def index
    @cart = session[:cart]
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart][id] = 1
    redirect_to cart_path
  end

  def remove_from_cart
    id = params[:id].to_s
    print(id)
    session[:cart].delete(id)
    redirect_to cart_path
  end

  def modify_cart_quantity
    id = params[:id].to_s
    print(params[:quantity])
    session[:cart][id] = params[:quantity].to_i
    redirect_to cart_path
  end

  def initialize_cart
    session[:cart] ||= {}
  end
end
