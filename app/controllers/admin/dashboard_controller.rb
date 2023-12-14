class Admin::DashboardController < ApplicationController
  # Add authentication for admins
  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]
  
  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
