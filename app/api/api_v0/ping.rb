module ApiV0
  class Ping < Grape::API
    desc 'Ping pong'
    # ip/api/v0/ping
    get "/ping" do
      "test grape api"
      # authenticate!
    end
  end
end