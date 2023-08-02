module CurrentUserConcern
    extend ActiveSupport::Concern
    included do
        before_action :restaurant
        before_action :user
    end

    def user
        if session[:user_id] # change according to how you wrote it on session create
            @user = Customer.find(session[:user_id])
        end
    end

    def restaurant
        if session[:user_id] # change according to how you wrote it on session create
            @res = Restaurant.find(session[:user_id])
        end
    end
end