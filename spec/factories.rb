FactoryGirl.define do
  factory :user do
    name "Harry Edwards"
    email "harryedwards@mac.com"
    password "foobar"
    password_confirmation "foobar"
  end
end