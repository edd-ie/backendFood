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

    def orders
        orders = finder.allOrders
        render json: orders, status: :ok
    end

    def activeOrders
        orders = finder.activeOrders
        render json: orders, status: :ok
    end

    def staff
        staff = finder.allStaff
        render json: staff, status: :ok
    end

    def menu
        menu = finder.menu
        render json: menu, status: :ok
    end

    def updateOrder
        change = finder.orderUpdate(params[:order_id],valid_params)
        render json: change, status: :accepted
    end

    def menu
        render json: finder.menu, status: :ok
    end

    def updateMenu
        id = params[:food_id]
        filtered = {}
        valid_params.each do |key, value|
            puts key
            if key != :food_id
                filtered[key] = value
            end
        end
        p filtered
        change = finder.menuChange(id,filtered)
        render json: change, status: :accepted
    end


    private

    def finder
        Restaurant.find(params[:id])
    end

    def valid_params
        params.permit(:id, :name, :email, :password, :password_confirmation, :phone, :policy, 
            :picture, :pay_bill, :till_num, :acc_num, :ambience, :ratings, :sales,
            :cuisine, :price_range, :latitude, :longitude,
            :items, :status, :order_id, :staff_id,:food_id,
            :chef_id, :paid, :complete,
            :category, :ingredients, :price, :discount, :restaurant_id, :vegetarian, :allergen, :ratings
        )
    end

    def no_records
        render json: {error: 'Restaurant not found'}, status: :not_found
    end

    def unprocessable(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
