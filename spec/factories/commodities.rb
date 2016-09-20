FactoryGirl.define do
  factory :commodity do
    shop_owner_id 1
    shipper_id 1
    title "MyString"
    description "MyString"
    price_deposite 1.5
    price_wage 1.5
    departures "MyString"
    destination "MyString"
    picked false
  end
end
