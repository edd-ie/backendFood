class RestaurantReviewsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable

    def index
      render json: RestaurantReview.all, status: :ok
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
      review = RestaurantReview.create!(valid_params)
      render json: review, status: :created
    end

    def destroy
      finder.destroy
      head :no_content
    end


    
    
    private

    def finder
      RestaurantReview.find(params[:id])
    end

    def valid_params
        params.permit(:id, :comment, :customer_id, :restaurant_id, :like, :rating, :dislike)
    end

    def no_records
        render json: {error: 'RestaurantReview not found'}, status: :not_found
    end

    def unprocessable(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
