class RestaurantsController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable
    
    def index
        restaurants = Restaurant.all
        render json: restaurants, status: :ok
    end

    def show
        restaurant = finder
        render json: restaurant, status: :ok
    end

    def create
        restaurant = Restaurant.create!(valid_params)
        render json: restaurant, status: :created
    end

    def update
        restaurant = finder
        Restaurant.update!(valid_params)
        render json: restaurant, status: :accepted
    end

    def destroy
        finder.destroy
        head :no_content
    end


    private

    def finder
        Restaurant.find(params[:id])
    end

    def valid_params
        params.permit(:id, :name, :email, :password, :password_confirmation, :phone, :policy, 
            :picture, :pay_bill, :till_num, :acc_num, :ambience, :ratings, :sales,
            :cuisine, :price_range, :latitude, :longitude
        )
    end

    def no_records
        render json: {error: 'Restaurant not found'}, status: :not_found
    end

    def unprocessable(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
