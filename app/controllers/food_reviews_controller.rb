class FoodReviewsController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable

    def index
      render json: FoodReview.all, status: :ok
    end

    def show
      render json: finder, status: :ok
    end

    def update
      review = finder
      review.update!(valid_params)
      render json: review, status: :accepted
    end

    def create
      review = FoodReview.create!(valid_params)
      render json: review, status: :created
    end

    def destroy
      finder.destroy
      head :no_content
    end

    

    
    
    private

    def finder
      FoodReview.find(params[:id])
    end

    def valid_params
        params.permit(:id, :food_id, :customer_id, :comment, :like, :rating, :dislike)
    end

    def no_records
        render json: {error: 'FoodReview not found'}, status: :not_found
    end

    def unprocessable(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
