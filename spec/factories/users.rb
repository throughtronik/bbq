FactoryBot.define do
  factory :user do
    name { "Test_User#{rand(5)}" }

    sequence(:email) { |n| "test_user_email_#{n}@test.test" }

    after(:build) { |u| u.password_confirmation = u.password = "123123" }
  end
end
