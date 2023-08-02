Rails.application.config.action_dispatch.default_headers.merge!(
    {'Access-Control-Allow-Origin' => 'http://localhost:5173',
    'Access-Control-Allow-Credentials' => 'true'},
    {'Access-Control-Allow-Origin' => 'https://food-chapchap.vercel.app',
    'Access-Control-Allow-Credentials' => 'true'}
)
