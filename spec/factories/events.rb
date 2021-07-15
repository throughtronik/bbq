FactoryBot.define do
  factory :event do
    title { "Test_Event_#{rand(5)}" }
    address { 'Test str' }
    datetime { DateTime.now + 1.year }

    association :user
  end
end
