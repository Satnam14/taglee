Rails.application.config.middleware.use OmniAuth::Builder do
  provider :instagram, ENV['4aead3fa55984b0ba07b51a9da7e8fb2'], ENV['51c0b099b6284593beb1e68a516224a3']
end
