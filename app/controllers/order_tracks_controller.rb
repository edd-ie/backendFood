class OrderTracksController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable

    def index
        render json: OrderTrack.all, status: :ok
    end

    def show
        render json: finder, status: :ok
    end

    def create
        track = OrderTrack.create!(valid_params)
        render json: track, status: :created
    end

    def update
        finder.update!(valid_params)
        render json: finder, status: :accepted
    end

    def destroy
        finder.destroy
        head :no_content
    end

    private

    def finder
        OrderTrack.find(params[:id])
    end

    def valid_params
        params.permit(:id, :items, :status, :order_id, :restaurant_id, :staff_id, :chef_id, :paid, :complete)
    end

    def no_records
        render json: {error: 'Order not found'}, status: :not_found
    end

    def unprocessable(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end
end
