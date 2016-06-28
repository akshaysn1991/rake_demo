namespace :demo do
  desc "rake simple hello"
  task say_hello: :environment do
    puts "Hello"
  end

  desc "rake import data from person csv files"
  task import: :environment do
    require 'csv'
    CSV.foreach('db/data/person.csv', :headers => true) do |row|
      Person.create!(row.to_hash)
    end
  end

  desc "rake import data from product csv files"
  task import_product: :environment do
    require 'csv'
    CSV.foreach('db/data/product.csv', :headers => true) do |row|
      name = row[0]
      price = row[1].to_i
      Product.create(name: name, price: price)
    end
  end
end
