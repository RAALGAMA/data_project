# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "csv"

# GamesSale.delete_all
# Game.delete_all
# Sale.delete_all
# Platform.delete_all
# Publisher.delete_all
# Page.delete_all

filename = Rails.root.join("db/vgsales.csv")
puts "Loading games and data from csv file: #{filename}"

csv_data = File.read(filename)
games = CSV.parse(csv_data, headers: true, encoding: "utf-8")

games.each do |game_data|
  platform = Platform.find_or_create_by(name: game_data["Platform"])
  publisher = Publisher.find_or_create_by(name: game_data["Publisher"])
  game = Game.find_or_create_by(
    rank:      game_data["Rank"],
    name:      game_data["Name"],
    genre:     game_data["Genre"],
    publisher:,
    platform:
  )
  sale = Sale.find_or_create_by(
    na_sales:     game_data["NA_Sales"],
    eu_sales:     game_data["EU_Sales"],
    jp_sales:     game_data["JP_Sales"],
    other_sales:  game_data["Other_Sales"],
    global_sales: game_data["Global_Sales"]
  )

  games_sale = GamesSale.find_or_create_by(Games_id: game.id, Sale_id: sale.id)
  if games_sale.save
    puts "Successfully created"
  else
    puts games_sale.errors.full_messages
  end
end

Page.create(
  title:     "About the Data",
  content:   "The data powering this website comes directly from UNLIMITED POWAAAAA!!!!",
  permalink: "about_the_data"
)
Page.create(
  title:     "Contact us",
  content:   "if you like UNLIMITED POWAAAAA!!!!, please reach us at UNLIMITEDPOWAAAAA@gmail.com",
  permalink: "contact"
)

puts "Seed data loaded successfully!"
