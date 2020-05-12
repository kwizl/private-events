FactoryBot.define do
  factory :event do
    name { 'MyString' }
    description { 'MyText' }
    date { Time.zone.today }
    user
  end
end
