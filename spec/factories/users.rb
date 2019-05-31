FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    # set confirmed_at, so it won't send confirmation email when running tests
    confirmed_at { Time.now }
  end
end
