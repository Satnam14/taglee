class SessionsController < ApplicationController
  def create
    fail
    uri = URI.parse("https://api.instagram.com/oauth/access_token")

    # Shortcut
    #response = Net::HTTP.post_form(uri, {"user[name]" => "testusername", "user[email]" => "testemail@yahoo.com"})
    code = nil

    # Full control
    http = Net::HTTP.new(uri.host, uri.port)

    req = Net::HTTP::Post.new(uri.request_uri)
    req.set_form_data({
      "client_id" => "2d4b160efb7248e983383029b9e904e8",
      "client_secret" => "4d4946c188f2474d8845106903c0cb8d",
      "grant_type" => "authorization_code",
      "redirect_uri" => "http://localhost:3000/users/auth/instagram/callback",
      "code" => params['code']
    })

    res = http.request(req)
    render :json => res.body
    # raise env["omniauth.auth"].to_yaml
  end
end


# curl -F 'client_id=2d4b160efb7248e983383029b9e904e8' \
#     -F 'client_secret=4d4946c188f2474d8845106903c0cb8d' \
#     -F 'grant_type=authorization_code' \
#     -F 'redirect_uri=http://localhost:3000/users/auth/instagram/callback' \
#     -F 'code=5e46395807c84ed7b5be20c47245ae39' \
#     https://api.instagram.com/oauth/access_token
