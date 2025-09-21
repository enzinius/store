class SubcribersController < ApplicationController
  allow_unauthenticated_access
  before_action :set_product

  def create
    @product.subscribers.where(subsciber_params).first_or_create
    redirect_to @product, notice: "Thank you for subscribing to be notified when this product is back in stock."
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def subscriber_params
    params.expect(subscriber: [ :email ])
  end
end
