# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'
ActiveRecord::Base.transaction do
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

  100.times do |i|
    f = Flight.new(departure_airport_id: Airport.all.sample.id, date: rand(Date.current..(Date.current + 6.months)), duration: sample_durations.sample)
    f.arrival_airport_id = Airport.where.not(id: f.departure_airport_id).sample.id
    f.save!
  end
  puts "There are now #{Flight.count} rows in the flights table"
end