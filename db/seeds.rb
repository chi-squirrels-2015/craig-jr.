# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# user1 = User.create!(email: "shiraz@sherwani.com", password: 'password', password_confirmation: 'password')

# category1 = Category.create!(name: "Help Wanted")

craigslist = ['antiques', 'appliances', 'arts+crafts', 'atvs / utvs / snowmobiles', 'auto parts', 'baby+kids', 'barter', 'bicycle parts', 'bikes', 'boat parts', 'boats', 'books', 'business', 'cars + trucks', 'cds/dvd/vhs', 'cell phones', 'clothes+acc', 'collectibles', 'computer parts', 'computers+tech', 'electronics', 'farm+garden', 'free stuff', 'furniture', 'garage & moving sales', 'general', 'health+beauty', 'heavy equipment', 'household', 'jewelry', 'materials', 'motorcycle parts', 'motorcycles/scooters', 'musical instruments', 'photo+video', 'recreational vehicles', 'sporting goods', 'tickets', 'tools', 'toys+games', 'video gaming']

# Article.create!(user: user1, title: "Spark plugs", description: "Heavy duty. They'll last, trust me.", category: category1 )

# Create users
50.times do
  User.create!(email: Faker::Internet.free_email, password: 'password', password_confirmation: 'password')
end

users = User.all

# Create categories
craigslist.each do |category|
  Category.create!(name: category)
end

categories = Category.all

# Create articles
150.times do
  Article.create!(user: users.sample, title: Faker::Commerce.product_name, description: Faker::Lorem.paragraph, category: categories.sample)
end

