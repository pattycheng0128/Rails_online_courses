FactoryBot.define do
  factory :api_access_token do
    association :user, factory: [:user]
    key { SecureRandom.uuid.delete("-") }
  end

  factory :user do
    username {Faker::Name.unique.name}
    email { Faker::Internet.email }
    password { "a00000000" }
  end

  factory :order do
    user_id {user.id}
    username {user.username}
    pay_status {"paid"}
  end

end