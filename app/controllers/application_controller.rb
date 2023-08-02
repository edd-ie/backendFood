class ApplicationController < ActionController::Base
    include ActionController::Cookies
    skip_forgery_protection
end
