FactoryGirl.define do 
  factory :user do
   name "Orrett Davis"
   email "orrett.davis@gmail.com"
   password "hello"
   password_confirmation "hello"
   confirmed_at Time.now
  end
end