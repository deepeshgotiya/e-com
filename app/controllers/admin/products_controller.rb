class Admin::ProductsController < ApplicationController
  before_action :intialize_product, only: [:new, :create]
  before_action :fetch_product, except: [:new, :create]
  before_action :fetch_product_category, only: [:create, :update]
 
  def new
    @product
  end

  def create
    @product.assign_attributes(permitted_params)
    @product.product_category = @product_category
    if @product.save
      flash[:notice] = "Category Successfully created!"
      redirect_to admin_product_category_path(@product_category)
    else
      flash[:notice] = @product.erros.full_messages
    end
  end

  def edit
   @product
  end

  def update
    @product.assign_attributes(permitted_params)
    if @product.save
      flash[:notice] = "Category Successfully updated!"
      redirect_to admin_product_category_path(@product_category)
    else
      flash[:error] = @product.errors.full_messages
    end
  end

  def show
    @product
  end

  def destroy
    @product.destroy 
    flash[:notice] = "Category Successfully destroyed!"
  end

  private
  
  def permitted_params
    params.require(:product).permit(:name, :image)
  end

  def intialize_product
    @product = Product.new
  end

  def fetch_product
    @product = Product.find(params[:id])
  end

  def fetch_product_category
    @product_category = ProductCategory.find(params[:product_category_id])
  end
end
