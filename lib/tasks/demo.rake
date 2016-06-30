namespace :demo do
  desc "rake simple hello"
  task say_hello: :environment do
    puts "Hello"
  end
end

namespace :import do
  desc "rake import data from person csv files"
  task person_data: :environment do
    require 'csv'
    CSV.foreach('db/data/person.csv', :headers => true) do |row|
      Person.create!(row.to_hash)
    end
  end

  desc "rake import data from product csv files"
  task product_data: :environment do
    require 'csv'
    CSV.foreach('db/data/product.csv', :headers => true) do |row|
      name = row[0]
      price = row[1].to_i
      Product.create(name: name, price: price)
    end
  end
end
