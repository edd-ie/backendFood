class OrdersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable

    def index
        orders = Order.all
        render json: orders, status: :ok
    end

    def show
        render json: finder, status: :ok
    end

    def update
        finder.update!(valid_params)
        render json: finder, status: :accepted
    end

    def destroy
        finder.destroy
        head :no_content
    end

    def create
        order = Order.create!(items:params[:items], total:params[:total], service_fee:params[:service_fee], discount:params[:discount], food_id:params[:food_id], latitude:params[:latitude], longitude:params[:longitude], restaurant_id:params[:restaurant_id], customer_id:params[:customer_id])
        order.newTrack(params[:paid])
        render json: order, status: :created
    end



    
    private

    def finder
        Order.find(params[:id])
    end

    def valid_params
        params.permit(:id, :items, :staff_id, :paid, :total, :service_fee, :discount, :food_id, :latitude, :longitude, :restaurant_id, :customer_id)
    end

    def no_records
        render json: {error: 'Order not found'}, status: :not_found
    end

    def unprocessable(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
