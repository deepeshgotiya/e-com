class Admin::ProductCategoriesController < ApplicationController
  before_action :intialize_product_category, only: [:new, :create]
  before_action :fetch_product_category, except: [:index, :new, :create]

  def index
    @product_categories = ProductCategory.all
  end
  
  def new
    @product_category
  end

  def create
    @product_category.admin = current_admin
    @product_category.assign_attributes(permitted_params)
    if @product_category.save
      flash[:notice] = "Category Successfully created!"
      redirect_to admin_product_categories_path
    else
      flash[:notice] = @product_category.errors.full_messages
    end
  end

  def edit
   @product_category
  end

  def update
    @product_category.assign_attributes(permitted_params)
    if @product_category.save
      flash[:notice] = "Category Successfully updated!"
      redirect_to admin_product_categories_path
    else
      flash[:error] = @product_category.errors.full_messages
    end
  end

  def show
    @product_category
  end

  def destroy
    @product_category.destroy 
    flash[:notice] = "Category Successfully destroyed!"
  end

  private
  
  def permitted_params
    params.require(:product_category).permit(:name, :description)
  end

  def intialize_product_category
    @product_category = ProductCategory.new
  end

  def fetch_product_category
    @product_category = ProductCategory.find(params[:id])
  end
end
