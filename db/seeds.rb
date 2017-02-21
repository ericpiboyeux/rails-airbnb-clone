# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# https://github.com/stympy/faker
t_index = 0
address_array = ["248 Rue du Jardin public, 33300 Bordeaux",
  "127 Cours du Médoc, 33300 Bordeaux",
  "4 Impasse Cabrière, 33300 Bordeaux",
  "12 Cité Chantecrit, 33300 Bordeaux",
  "35 Rue de Leybardie, 33300 Bordeaux",
  "74 Rue Maurice, 33300 Bordeaux",
  "60 Rue Borie, 33300 Bordeaux",
  "108 Rue Barreyre, 33300 Bordeaux",
  "102 Rue Prunier, 33300 Bordeaux",
  "14 Rue Etienne Huyard, 33300 Bordeaux",
  "28 Rue André Bac, 33300 Bordeaux",
  "18 Rue Charles Puyo, 33300 Bordeaux",
  "46 Allée Haussmann, 33300 Bordeaux",
  "40 Rue Armand Dulamon, 33300 Bordeaux",
  "12 Rue Vieillard, 33300 Bordeaux"
]
first_name_array = ["Marie","Jean","Laurence","Karine","André","Anne","Jane"]
last_name_array = ["pon","du","pierre","doen","fran","sen","dieu","petit"]

15.times do
  user_seed = User.new(
    firstname: first_name_array.sample,
    lastname: (last_name_array.sample + last_name_array.sample).capitalize,
    address: address_array[t_index],
    email: "test#{t_index + 1}@gmail.com",
    password: "password"
  )
  user_seed.save!
  t_index += 1
  # address: "#{Faker::Address.street_address}, #{Faker::Address.city}"

  user_dish_number = (0..5).to_a.sample

  user_dish_number.times do
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
    #zone = DateTime.now.zone

    availability_seed = Availability.new(
      available_datetime: DateTime.new(2017, 02, day, hour, 0, 0),
      portions: (1..5).to_a.sample
    )

    availability_seed.dish = dish_seed
    availability_seed.save!

    if rand < 0.3
      availability_seed.portions > 1 ? p_mod =  1 : p_mod = 0

      order_seed = Order.new(
        portions: availability_seed.portions - p_mod,
        review_description: Faker::Lorem.sentence(5),
        review_rating: (1..5).to_a.sample
      )

      order_seed.user = user_seed
      order_seed.availability = availability_seed
      order_seed.save!
    end
  end
end
