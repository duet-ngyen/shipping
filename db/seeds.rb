# Create User
puts "Creating User..."
10.times do
  User.create!(
      full_name: Faker::Name.name,
      email: Faker::Internet.email,
      password: "abcd1234",
      password_confirmation: "abcd1234",
      address: Faker::Address.city,
      phone_number: Faker::PhoneNumber.cell_phone
  )
end
print "Done"

# Create Commodity
puts "Creating Commidity..."
10.times do
  shop_owner_id = User.all.sample.id
  shipper_id    = (User.ids - [shop_owner_id]).sample

  Commodity.create!(
    shop_owner_id: shop_owner_id,
    shipper_id: shipper_id,
    title: Faker::Book.title,
    price_deposite: Faker::Commerce.price,
    price_wage: Faker::Commerce.price,
    departures: Faker::Address.city,
    destination: Faker::Address.city,
    picked: true
  )
end
print "Done"