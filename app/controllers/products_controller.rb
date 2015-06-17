class ProductsController < ApplicationController

  def index 
    @products = Product.all
    if params[:sort] && params[:sort_order]
      @products  = Product.order(params[:sort] => params[:sort_order])
    end
    if params[:discount]
      @products = Product.where("price < ?", 10)
    end
    if params[:category]
      @products = Category.find_by(name: params[:category]).products
    end
  end

    def show
    if params[:id] == "random"
      products = Product.all
      @product= products.sample
    else
      @product = Product.find_by(id: params[:id])
    end
  end

  def new 
  end

  def create 
    @product = Product.create(id: params[:id], name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    flash[:success] = "Product Successfully Added!"
    redirect_to "/products/#{product.id}"
  end

  def edit
    @product = Product.find_by(id:product_id)
  end

  def update 
    @product = Product.find_by(id: params[:id])
    @product.update(id: params[:id], name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    flash[:success] = "Product Successfully Updated!"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:warning] = "Product Successfully Deleted!"
    redirect_to "/"
  end

  def search
    search_term = params[:search]
  @products = Product.where("name LIKE ? OR description LIKE ? OR image LIKE 
      ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
    render :index
  end
end