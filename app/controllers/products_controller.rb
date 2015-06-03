class ProductsController < ApplicationController

  def index 
    @products = Product.all
  end

  def show
    product_id = params[:id]
    @product = Product.find_by(id: product_id)
  end

  def new 
  end


  def create 
    product = Product.create(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    flash[:success] = "Product Successfully Added!"
    redirect_to "/products/#{product.id}"
  end

  def edit
    product_id = params[:id]
    @product = Product.find_by(id:product_id)
  end

  def update 
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.update(name: params[:name], price: params[:price], image: params[:image], description: params[:description])
    flash[:success] = "Product Successfully Updated!"
    redirect_to "/products/#{product.id}"

  end

  def destroy
    product_id = params[:id]
    product = Product.find_by(id: product_id)
    product.destroy
    flash[:success] = "Product Successfully Deleted!"
    redirect_to "/products/"
  end

end