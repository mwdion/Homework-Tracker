FactoryGirl.define do
  factory :user do
    email "test@example.com"
    password "password"
    password_confirmation "password"
  end
  factory :location do
    location_name "Boston, MA"
  end
  factory :unit do 
    name "Ruby on Rails"
    date "2015-01-05"
  end
end

