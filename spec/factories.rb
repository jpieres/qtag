FactoryGirl.define do
  factory :user do
    name     "Juan Perez"
    email    "juan@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end