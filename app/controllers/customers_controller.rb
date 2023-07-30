class CustomersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable

    def index
        customers = Customer.all
        render json: customers
    end

    def show
        customer = finder
        render json: customer, status: :ok
    end

    def create
        customer = Customer.create!(valid_params)
        render json: customer, status: :created
    end

    def update
        customer = finder
        customer.update!(valid_params)
        render json: customer, status: :accepted
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

    def favRes
        favRes = finder.favRes
        render json: favRes, status: :ok
    end
    
    def favFoods
        favFoods = finder.favFoods
        render json: favFoods, status: :ok
    end

    def newFavRes
        restaurant = finder.newRes(params[:restaurant_id])
        render json: restaurant, status: :created
    end
    
    def newFavFood
        food = finder
        food.newFood(params[:food_id])
        render json: food, status: :created
    end


    private

    def finder
        Customer.find(params[:id])
    end

    def valid_params
        params.permit(:id, :username, :email, :password, :password_confirmation, :phone, :policy, :picture, :food_id,:restaurant_id)
    end

    def no_records
        render json: {error: 'Customer not found'}, status: :not_found
    end

    def unprocessable(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end

