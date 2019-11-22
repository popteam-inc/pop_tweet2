Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,
  ENV["API_KEY"],
  ENV["API_SECRET_KEY"]
end