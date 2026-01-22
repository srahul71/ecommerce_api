# app/controllers/api/cart_items_controller.rb
class Api::CartItemsController < ApplicationController
  def create
    cart = current_user.cart || current_user.create_cart
    cart.cart_items.create!(
      product_id: params[:product_id],
      quantity: 1
    )

    render json: { message: 'Product added to cart' }
  end
end
