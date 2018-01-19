# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.destroy_all
Registration.destroy_all
Photo.destroy_all
Event.destroy_all
Profile.destroy_all
User.destroy_all

conferences = Category.create(name: "Conferences")
seminars = Category.create(name: "Seminars")
meetings = Category.create(name: "Meetings")
team_building_events = Category.create(name: "Team Building Events")
trade_shows = Category.create(name: "Trade Shows")
business_dinners = Category.create(name: "Business Dinners")
golf_events = Category.create(name: "Golf Events")
networking_events = Category.create(name: "Networking Events")

miriam = User.create(email: "miriam@codaisseurbnb.com", password: "abcd1234")
wouter = User.create(email: "wouter@codaisseurbnb.com", password: "abcd1234")
matt = User.create(email: "matt@codaisseurbnb.com", password: "abcd1234")


event1 = Event.create!(
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
   categories: [networking_events, meetings]
 )

 event2 = Event.create!(
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
    categories: [team_building_events, seminars]
  )

  event3 = Event.create!(
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
     categories: [conferences, seminars]
   )

   photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/irinaovdii/image/upload/v1516275887/NetwEv_opfwi2.jpg", event: event1)
   photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/irinaovdii/image/upload/v1516275887/GE_ifh9ki.jpg", event: event2)
   photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/irinaovdii/image/upload/v1516275887/BD_pmky27.jpg", event: event3)
   photo4 = Photo.create!(remote_image_url: "http://res.cloudinary.com/irinaovdii/image/upload/v1516275887/TS_xkxkq6.jpg", event: event1)
   photo5 = Photo.create!(remote_image_url: "http://res.cloudinary.com/irinaovdii/image/upload/v1516275887/TS_xkxkq6.jpg", event: event2)
   photo6 = Photo.create!(remote_image_url: "http://res.cloudinary.com/irinaovdii/image/upload/v1516275886/TB_teprtn.jpg", event: event3)

   Registration.create!(event: event1, user: wouter, status: true, guest_count: 2)
   Registration.create!(event: event2, user: matt, status: true, guest_count: 1)
