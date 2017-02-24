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

first_name_array = ["Marie","Laurence","Karine","Anne","Jeanne","Julie","Jean","André","Pierre","Charles"]
last_name_array = ["pon","du","pierre","doen","fran","sen","dieu","petit"]

user_photo_array = ["http://res.cloudinary.com/erwannddlv/image/upload/v1487856990/woman4_lhs5z6.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487856987/woman5_fock3f.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487856987/woman1_qtzyrr.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487856987/woman2_r7gisj.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487856986/woman6_hmw7yc.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487856986/woman3_usrnqi.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487856985/man2_d3zirk.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487856985/man3_f0jcnj.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487856985/man4_e6uvak.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487856985/man1_zwmfrz.jpg"]

dish_photo_array = ["http://res.cloudinary.com/erwannddlv/image/upload/v1487851870/blanquette_szevkn.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487856985/soupe-thai_y590f6.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487851872/salade_grecque_wnli7w.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487851872/steack_frites_fpaibb.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487851872/salade_lyonnaise_u0vzzt.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487851872/rognons_kxyvum.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487851871/pates_au_pesto_zljufp.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487851871/pates_dbz7kp.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487851871/jambon_crudite%CC%81s_nflklh.jpg",
"http://res.cloudinary.com/erwannddlv/image/upload/v1487851871/croque_monsieur_gwqys2.jpg"]

dish_attributes = [
  {name: "Blaquette de veau",
    vegetarian: false,
    gluten_free: false,
    bio: false,
    price: 6},
  {name: "Soupe Thaï",
    vegetarian: false,
    gluten_free: false,
    bio: false,
    price: 4},
  {name: "Salade grecque",
    vegetarian: false,
    gluten_free: false,
    bio: false,
    price: 5},
  {name: "Steack frites",
    vegetarian: false,
    gluten_free: false,
    bio: false,
    price: 6},
  {name: "Salade Lyonnaise",
    vegetarian: false,
    gluten_free: false,
    bio: false,
    price: 5},
  {name: "Rognons",
    vegetarian: false,
    gluten_free: false,
    bio: false,
    price: 7},
  {name: "Pâtes au pesto",
    vegetarian: false,
    gluten_free: false,
    bio: false,
    price: 6},
  {name: "Pâtes",
    vegetarian: false,
    gluten_free: false,
    bio: false,
    price: 5},
  {name: "Sandwich jambon crudité",
    vegetarian: false,
    gluten_free: false,
    bio: false,
    price: 3},
  {name: "Croque-Monsieur",
    vegetarian: false,
    gluten_free: false,
    bio: false,
    price: 4}]

10.times do
  user_seed = User.new(
    firstname: first_name_array[t_index],
    lastname: (last_name_array.sample + last_name_array.sample).capitalize,
    address: address_array[t_index],
    email: "test#{t_index + 1}@gmail.com",
    password: "password"
  )
  user_seed.photo_url = user_photo_array[t_index]
  user_seed.save!

  dish_seed = Dish.new(
  name: dish_attributes[t_index][:name],
  description: Faker::Lorem.sentence(4),
  vegetarian: dish_attributes[t_index][:vegetarian],
  gluten_free: dish_attributes[t_index][:gluten_free],
  bio: dish_attributes[t_index][:bio],
  price: dish_attributes[t_index][:price]
  )

  dish_seed.user = user_seed
  dish_seed.photo_url = dish_photo_array[t_index]
  dish_seed.save!

  t_index += 1

  hour = [12, 20].sample
  date = DateTime.now + (0..5).to_a.sample.day
  alea = 1 + rand(3)

  alea.times do
    availability_seed = Availability.new(
      available_datetime: DateTime.new(2017, date.month, date.day, hour, 0, 0),
      portions: (1..4).to_a.sample
    )

    availability_seed.dish = dish_seed
    availability_seed.left_portions = availability_seed.portions
    availability_seed.save!
    date += 1.day

    if rand < 0.5
      portions_taken = availability_seed.portions.fdiv(2).round
      order_seed = Order.new(
        review_description: Faker::Lorem.sentence(5),
        review_rating: (1..5).to_a.sample,
        portions: portions_taken
      )
      order_seed.user = user_seed
      order_seed.availability = availability_seed
      order_seed.save!
      availability_seed.left_portions -= portions_taken
      availability_seed.save!
    end
  end
end


# more orders and reviews

