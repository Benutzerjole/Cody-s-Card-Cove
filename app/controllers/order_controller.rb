class OrderController < ApplicationController
  before_action :authenticate_user!
  
  def invoice
    session[:address_details] = {
      province_id: request.GET['Province'],
      address: request.GET['address'],
      city: request.GET['city'],
      zip_code: request.GET['zip_code'],
    }
    
    @cart = session[:cart]
    @user = current_user
    @address_details = session[:address_details]
    @province = Province.find(session[:address_details][:province_id])
  end


end
