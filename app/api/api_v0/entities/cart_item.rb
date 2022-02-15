module ApiV0
  module Entities
    class CartItem < Entities::Base
      expose :id
      expose :cart_id
      expose :course_id
    end
  end
end