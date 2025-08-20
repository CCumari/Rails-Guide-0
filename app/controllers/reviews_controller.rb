class ReviewsController < ApplicationController
  before_action :set_product
  # Only authenticated users can create or delete reviews
  

  def create
    @review = @product.reviews.build(review_params)
    @review.user = Current.user

    if @review.save
      redirect_to @product, notice: "Review was successfully created."
    else
      # Re-render the product show page with errors
      @reviews = @product.reviews.includes(:user)
      render 'products/show', status: :unprocessable_entity
    end
  end

  def destroy
    @review = @product.reviews.find(params[:id])
    if @review.user == Current.user
      @review.destroy
      redirect_to @product, notice: "Review deleted."
    else
      redirect_to @product, alert: "You can't delete this review."
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end

