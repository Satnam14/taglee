Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :instagram, ENV['2d4b160efb7248e983383029b9e904e8'], ENV['4d4946c188f2474d8845106903c0cb8d']
end
