class FallbackController < ApplicationController
    def home
        render file: 'public/home.html'
    end

    def error
        render file: 'public/404.html'
    end
end
