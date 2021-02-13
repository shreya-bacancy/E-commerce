FactoryGirl.define do 
    factory :user do
      sequence(:name) { |n| "test#{n}" }
      sequence(:email) { |n| "test#{n}@test.com" }
      dob '12/2/1997'
      contact_no '9887654321'
      password '123456'
      password_confirmation '123456'
    end
  end