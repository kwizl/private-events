FactoryBot.define do
  factory :event do
    name { "MyString" }
    description { "MyText" }
    date { Date.today }
  end
end
