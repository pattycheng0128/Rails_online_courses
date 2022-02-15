module ApiV0
  module Helpers

    def authenticate!
      current_user or raise AuthorizationError
    end

    # env["api_v0.user"] 這個是在 middleware 先塞好的
    def current_user
      @current_user ||= env["api_v0.user"]
    end
  end
end