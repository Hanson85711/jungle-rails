class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']

  def show
    @product_items = Product.count
    @product_categories = Product.group(:category_id).count
  end
end
