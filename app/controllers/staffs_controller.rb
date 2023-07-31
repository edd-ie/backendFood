class StaffsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :no_records
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable

    def index
        staff = Staff.all
        render json: staff, status: :ok
    end

    def show
        staff = finder
        render json: staff, status: :ok
    end

    def create
        staff = Staff.create!(valid_params)
        render json: staff, status: :created
    end

    def update
        staff = finder
        staff.update!(valid_params)
        render json: staff, status: :accepted
    end

    def destroy
        finder.destroy
        head :no_content
    end


    private

    def finder
        Staff.find(params[:id])
    end

    def valid_params
        params.permit(:id, :name, :title, :restaurant_id, :active)
    end

    def no_records
        render json: {error: 'Staff not found'}, status: :not_found
    end

    def unprocessable(invalid)
        render json: { errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

end
