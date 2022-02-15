module ApiV0
  module Entities
    class Course < Entities::Base
      expose :id
      expose :name
      expose :price
      expose :courses_type
      expose :url
      expose :description
      expose :created_at, format_with: :iso8601
    end
  end
end