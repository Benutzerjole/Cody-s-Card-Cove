class ProductsController < ApplicationController
  def index 
    
    if !request.GET['page']
      params[:page] = 1
    end
    
    if request.GET['search']
      products = Product.where("lower(name) LIKE (?) or lower(description) LIKE (?)", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%")
      
      if request.GET['category'] && request.GET['category'] != "All"
        products = products.where("category_id = ?", params[:category])
      end

      if request.GET['filter'] == "On Sale"
        products = products.where('sale_price IS NOT NULL')
      end

      if request.GET['filter'] == "New Products"
        products = products.where('created_at > ?', 3.days.ago)
      end
      
      @products = products
    else
      @products = Product.all
    end
    @categories = Category.all
    @pages = @products.count / 16 + 1
    @products = @products.order(:name).page(params[:page].to_i)
  end

  def show
    @product = Product.find(params[:id])
  end
end
