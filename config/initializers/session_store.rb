if Rails.env.production?
	Rails.application.config.session_store :cookie_store, key: '48ac4cf8afd0fefdf61417d5be0cf594', domain: "https://backendfood-co7z.onrender.com"
else
    Rails.application.config.session_store :cookie_store, key: '48ac4cf8afd0fefdf61417d5be0cf594'
end