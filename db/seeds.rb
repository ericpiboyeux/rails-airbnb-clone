# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# https://github.com/stympy/faker
t_index = 0

20.times do
  t_index += 1
  user_seed = User.new(
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    email: "test#{t_index}@gmail.com",
    password: "password"
  )
  user_seed.save!
  # address: "#{Faker::Address.street_address}, #{Faker::Address.city}"

  dish_seed = Dish.new(
    name: "#{Faker::Food.ingredient} #{Faker::Food.spice}",
    vegetarian: Faker::Boolean.boolean,
    gluten_free: Faker::Boolean.boolean,
    bio: Faker::Boolean.boolean
  )
  dish_seed.user = user_seed
  dish_seed.save!

  hour = [12, 20].sample
  day = DateTime.now.day + (1..5).to_a.sample
  zone = DateTime.now.zone

  availability_seed = Availability.new(
    available_datetime: DateTime.new(2017, 02, day, hour, 0, 0, zone),
    portions: (1..5).to_a.sample
  )

  availability_seed.dish = dish_seed
  availability_seed.save!

  availability_seed.portions > 1 ? p_mod =  1 : p_mod = 0

  order_seed = Order.new(
    portions: availability_seed.portions - p_mod,
    review_description: Faker::Lorem.sentence(5),
    review_rating: (0..5).to_a.sample
  )

  order_seed.user = user_seed
  order_seed.availability = availability_seed
  order_seed.save!
end
