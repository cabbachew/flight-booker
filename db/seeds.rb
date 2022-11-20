# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'busiest_airports.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'UTF-8')
csv.each do |row|
  a = Airport.new
  a.iata_code = row['IATA Code']
  a.save
  puts "Airport with IATA code #{a.iata_code} saved"
end

puts "There are now #{Airport.count} rows in the airports table"

sample_durations = 360.step(720, 10).to_a # 6 to 12 hours in 10 minute increments
10.times do |i|
  Flight.create!(departure_airport_id: Airport.all.sample.id, arrival_airport_id: Airport.all.sample.id, datetime: rand(-5.years..5.years).ago, duration: sample_durations.sample)
end

puts "There are now #{Flight.count} rows in the flights table"

