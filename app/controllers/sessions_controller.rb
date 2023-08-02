class SessionsController < ApplicationController
    include CurrentUserConcern

    def cusLog
        user = Customer.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { error: "Invalid email or password" }, status: :unauthorized
        end
    end

    def resLog
        user = Restaurant.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { error: "Invalid email or password" }, status: :unauthorized
        end
    end


    def cusNew
        user = Customer.create!(valid_params)
        if user
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { error: "Try again after a few minutes" }, status: :internal_server_error
        end
    end
    
    def resNew
        user = Restaurant.create!(valid_params)
        if user
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json: { error: "Try again after a few minutes" }, status: :internal_server_error
        end
    end

    def destroy
        reset_session
        render json: { message: "Successfully logged out" }, status: :ok
    end

    def logged_in
        if @user
            render json: @user, status: :ok
        else
            render json: { logged_in: false }, status: :unauthorized
        end
    end

    def resLogged_in
        if @res
            render json: @res, status: :ok
        else
            render json: { logged_in: false }, status: :unauthorized
        end
    end

    private

    def valid_params
        params.permit(:email, :password, :password_confirmation, :username, :name,
            :phone, :policy, 
            :picture, :pay_bill, :till_num, :acc_num, :ambience, :ratings, :sales,
            :cuisine, :price_range, :latitude, :longitude,
            :items, :status, :order_id, :staff_id,:food_id,
            :chef_id, :paid, :complete,
            :category, :ingredients, :price, :discount, :restaurant_id, :vegetarian, :allergen, :ratings
        )
    end
    
end
