# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{name: "Kat", title: "Mom", username: "mommakat", password: "test", role: 1},
  {name: "Sue Ann", title: "grandma", username: "gmasue", password: "test", role: 0},
  {name: "Anthony", title: "Step-dad", username: "anthony", password: "test", role: 0}])

kids = Kid.create([{name: "Eli"}, {name: "Caleb"}, {name: "Nolan"}])

users.first.kids << kids.first
users.first.kids << kids.second
users.first.kids << kids.third
users.second.kids << kids.first
users.second.kids << kids.second
users.second.kids << kids.third
users.last.kids << kids.first
users.last.kids << kids.second
users.last.kids << kids.third

Event.create(title: "Soccer", location: "Westminster Rec Center", day_of_week: "Wednesday", time: "5:45 pm", description: "Bring Water", kid: kids.first)
Event.create(title: "Soccer", location: "Westminster Rec Center", day_of_week: "Wednesday", time: "5:45 pm", description: "Bring Cleats", kid: kids.second)
Event.create(title: "Soccer", location: "Westminster Rec Center", day_of_week: "Saturday", time: "9:15 am", description: "With Grandma", kid: kids.last)
Event.create(title: "Swimming", location: "Broomfield Rec Center", day_of_week: "Sunday", time: "6:00 pm", description: "1 hour", kid: kids.first)
Event.create(title: "Swimming", location: "Broomfield Rec Center", day_of_week: "Sunday", time: "6:15 pm", description: "45 minutes", kid: kids.second)
Event.create(title: "Toddler Class", location: "Westminster Rec Center", day_of_week: "Thursday", time: "10:00 am", description: "Mom on site", kid: kids.last)
Event.create(title: "Gym Fun", location: "Aunt April's House", day_of_week: "Friday", time: "5:00 pm", description: "Yay", kid: kids.last)
