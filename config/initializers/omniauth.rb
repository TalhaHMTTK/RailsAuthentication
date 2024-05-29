Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, Rails.application.credentials.dig(:facebook, :app_id), Rails.application.credentials.dig(:facebook, :app_secret)
end