class ReviewsController < ApplicationController

    before_action :require_login

    def create
    @review = Review.new(review_params)
    @review.user_id = session["user_id"]
    @review.product_id = params[:product_id]
      if @review.save
       redirect_to product_path(@review.product_id), notice: 'Review created!'
      else
       redirect_to product_path(@review.product_id)
      end
    end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to product_path(@review.product_id), notice: 'Review deleted!'
  end


  def review_params
    params.require(:review).permit(
      :description,
      :rating,
      :product_id,
      :user_id
    )
  end

    private

  def require_login
    unless session['user_id']
      flash[:error] = "You must be logged in to access this section"
      redirect_to products_path # halts request cycle
    end
  end
end
