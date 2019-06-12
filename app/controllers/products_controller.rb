class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
  end

   def destroy
    @review = Review.find(1)
    @review.destroy
    redirect_to product_path(@review.product_id), notice: 'Review deleted!'
  end


end
