if Rails.env.production?
	Rails.application.config.session_store :cookie_store, key: 'Food_ChapChap', domain: "https://backendfood-co7z.onrender.com"
else
    Rails.application.config.session_store :cookie_store, key: 'Food_ChapChap'
end