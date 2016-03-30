# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

1.times do |n|
  username = Faker::Name.first_name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(username: username,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.all
20.times do |n|
  title = Faker::Company.name
  url = Faker::Internet.url
  votes = rand(0..34)

  users.each { |user| user.links.create!(title: title, url: url, votes: rand(0..34))}

end

40.times do |n|
  links = Link.all
  random = links.sample
  author = Faker::Name.name
  body = Faker::Hacker.say_something_smart
  random.comments.create!(author: author, body: body)
end