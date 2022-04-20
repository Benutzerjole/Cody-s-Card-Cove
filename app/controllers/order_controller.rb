class OrderController < ApplicationController
  before_action :authenticate_user!
  
  def invoice
    @cart = session[:cart]
    @user = current_user
  end
end
