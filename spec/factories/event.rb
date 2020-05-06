FactoryBot.define do
  factory :event do
    name { "MyString" }
    description { "MyText" }
    date { Date.today }
    user
  end
end
