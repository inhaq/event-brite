# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email: "example@rails.org")
    
    10.times do |n|
    email = Faker::Internet.email
    title = Faker::Hipster.sentence(3)
    date = Faker::Time.between(2.years.ago, 10.years.from_now)
    User.create!(email: email)
    a = User.last
    c = a.events.build(title:title,date:date)
    c.save
    b = Event.last
    d = b.attendees.build(invitee:n,user_id:b.user_id)
    d.save
    end
