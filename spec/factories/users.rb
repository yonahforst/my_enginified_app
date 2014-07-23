# This will guess the User class
FactoryGirl.define do
  factory :user, class: Core::User do
    first_name "John"
    last_name  "Doe"
    password 'secret1234'
    confirmed_at Time.now
    sequence(:email) {|n| "user#{n}@email.com"}
    
    trait :admin do
      roles ['admin']
    end
    
    trait :unconfirmed do
      confirmed_at nil
    end
    
    trait :tenant do
      roles ['tenant']
    end
    
    trait :landlord do
      roles ['landlord']
    end
  end
end