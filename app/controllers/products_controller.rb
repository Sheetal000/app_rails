class ProductsController < ApplicationController
  layout :products_layout
  def show
    @product = Product.find(params[:id])
  end

  private
   def products_layout
    @current_user.special? ? "special" : "products"
  end
end
