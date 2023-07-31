class FoodsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable

    def index
        foods = Food.all
        render json: foods, status: :ok
    end

    def show
        food = finder
        render json: food, status: :ok
    end

    def create
        food = Food.create!(valid_params)
        render json: food, status: :created
    end

    def update
        food = finder
        food.update!(valid_params)
        render json: food, status: :accepted
    end

    def destroy
        finder.destroy
        head :no_content
    end


    private

    def finder
        Food.find(params[:id])
    end

    def valid_params
        params.permit(:id, :name, :discount, :food_id, :vegetarian, :allergen, :category,
            :sales, :ratings, :price, :ingredients, :picture)
    end

    def no_records
        render json: {error: 'Food not found'}, status: :not_found
    end

    def unprocessable(invalid)
        render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
