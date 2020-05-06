FactoryBot.define do
  factory :user do
    name { "MyString" }
    password { "123" }
  end

  factory :event do
    name { "MyString" }
    description { "MyText" }
    date { Date.today }
    user
  end
end
