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

  def place_order

    address_details = session[:address_details]

    puts(address_details["province_id"])

    current_province = Province.find(address_details["province_id"])
    current_order = Order.create(address: address_details["address"], province: current_province, city: address_details["city"], zip_code: address_details["zip_code"], user: current_user, gst: current_province.gst, pst: current_province.pst, hst: current_province.hst)

    if current_order.valid?
      products = session[:cart]

      products.each do |product|
        current_product = Product.find(product[0])
        current_price = current_product.sale_price || current_product.base_price
        current_product.quantity_in_stock = current_product.quantity_in_stock - product[1]
        if current_product.valid?
          OrderProduct.create(quantity: product[1], price: current_price, product: current_product, order: current_order)
          current_product.save
        else
          current_order.order_products.each do |order_product|
            order_product.destroy
          end
          validation_errors = current_product.errors.full_messages
          flash["alert"] = "Error placing order: #{validation_errors}"
          current_order.destroy
          redirect_to cart_path
          return false
        end
      end
  
      session[:cart] = {}
      session[:address_details] = {}
      flash[:notice] = "Order with id ##{current_order.id} placed."
      redirect_to root_path
    else
      validation_errors = current_order.errors.full_messages
      flash["alert"] = "Error placing order: #{validation_errors}"
      redirect_to cart_path
    end

  end

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end


end