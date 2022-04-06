class ProductsController < ApplicationController
  def index 
    if request.GET['search']
      products = Product.where("lower(name) LIKE (?) or lower(description) LIKE (?)", "%#{params[:search].downcase}%", "%#{params[:search].downcase}%")
      
      if request.GET['category'] && request.GET['category'] != "All"
        products = products.where("category_id = ?", params[:category])
      end
      
      @products = products
    else
      @products = Product.all
    end
    @categories = Category.all
  end

  def show
    @product = Product.find(params[:id])
  end
end
