module ApiV0
  class Base < Grape::API
    version 'v0', using: :path
    
    helpers ::ApiV0::Helpers
    mount Ping
    use ApiV0::Auth::Middleware
    # include ApiV0::ExceptionHandlers
    mount Orders
    mount Courses
    mount CartItems
  end
end