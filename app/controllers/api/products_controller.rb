# app/controllers/api/products_controller.rb
class Api::ProductsController < ApplicationController
  before_action :set_product, only: [:update, :destroy]

  def create
    product = current_user.products.build(product_params)
    authorize product

    if product.save
      render json: product
    else
      render json: product.errors, status: 422
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end

  def product_params
    params.permit(:name, :price, :description)
  end
end
