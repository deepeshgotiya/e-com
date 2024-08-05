class ApplicationController < ActionController::Base
  
  add_flash_types :danger, :info, :warning, :success, :messages
  
  def after_sign_in_path_for(resource)
    puts "deepesg"
    admin_product_categories_path
  end 
end
