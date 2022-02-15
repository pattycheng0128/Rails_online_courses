module ApiV0
  class Ping < Grape::API
    desc 'Ping pong'
    get "/ping" do
      "test grape api"
      # authenticate!
    end
  end
end