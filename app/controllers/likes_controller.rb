class LikesController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @like = current_user.likes.create(review_id: params[:review_id])
  end

  def destroy

  end
end
