# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins '*'

#     resource '*',
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head]
#   end
# end

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:5173'  # Frontend website url

    resource '*',
      headers: :any,
      methods: :any,
      credentials: true
  end
  
  allow do
    origins '*'  # Frontend website url

    resource '*',
      headers: :any,
      methods: :any,
      # credentials: true
  end
end