module ApiV0
  module Entities
    class Order < Entities::Base
      expose :id
      expose :user_id
      expose :username
      expose :phone
      expose :pay_status
      expose :created_at, format_with: :iso8601
    end
  end
end