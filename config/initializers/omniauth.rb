Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '121137448023196', '85c21eda9e878fa3f843b4de5ffa4d10'
end