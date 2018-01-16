# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
User.destroy_all

modern_and_minimal = Category.create(name: "Modern and Minimal")
sleek_and_sophisticated = Category.create(name: "Sleek and Sophisticated")
warm_and_cozy = Category.create(name: "Warm and Cozy")
room_with_a_view = Category.create(name: "Room with a View")
elegant_and_ornate = Category.create(name: "Elegant and Ornate")
a_mans_touch = Category.create(name: "A Man's Touch")
white_washed = Category.create(name: "White Washed")
tempting_terrace = Category.create(name: "Tempting Terrace")

miriam = User.create(email: "miriam@codaisseurbnb.com", password: "abcd1234")
wouter = User.create(email: "wouter@codaisseurbnb.com", password: "abcd1234")
matt = User.create(email: "matt@codaisseurbnb.com", password: "abcd1234")


Event.create!(
  name: "Evening with friends",
  description: "Benefiting Monroe Carell Jr. Children's Hospital at Vanderbilt, this casual
  event includes an auction, entertainment, and food from the Loveless Café. Chaired by Kira
  Roberts and Kristi Skeeters, the event is coordinated by volunteer members of Friends of Children's Hospital,
  a volunteer organization of members supporting the mission of Monroe Carell Jr.
  Children's Hospital at Vanderbilt through fundraising, community awareness, and services to the patients
  and their families.",
  location: "The Loveless Barn 8400 Highway 100",
  price: 5,
  capacity: 15,
  includes_food: true,
  includes_drinks: false,
   starts_at: Time.now + 10.days,
   ends_at:  Time.now + 11.days,
   active: true,
   user: miriam,
   categories: [warm_and_cozy, a_mans_touch]
 )

 Event.create!(
   name: "Morning with friends",
   description: "It is a long established fact that a reader will be distracted by the readable
   content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a
   more-or-less normal distribution of letters, as opposed to using
   'Content here, content here', making it look like readable English.",
   location: "The Barn 8400 Highway 200",
   price: 10,
   capacity: 25,
   includes_food: false,
   includes_drinks: false,
    starts_at: Time.now + 15.days,
    ends_at:  Time.now + 16.days,
    active: true,
    user: wouter,
    categories: [elegant_and_ornate, white_washed]
  )

  Event.create!(
    name: "Day with friends",
    description: "It is a long established fact that a reader will be distracted by the readable
    content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a
    more-or-less normal distribution of letters, as opposed to using
    'Content here, content here', making it look like readable English.",
    location: "The Barn 8400 Highway 200",
    price: 10,
    capacity: 25,
    includes_food: false,
    includes_drinks: false,
     starts_at: Time.now + 15.days,
     ends_at:  Time.now + 16.days,
     active: true,
     user: matt,
     categories: [elegant_and_ornate, white_washed]
   )
