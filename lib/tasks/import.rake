require 'csv'
require 'open-uri'

namespace :import do

  desc "Import samples from CSV file"
  task samples: :environment do
    filename = File.join Rails.root, "samples.csv"
    counter = 0

    CSV.foreach(filename, headers: true) do |row|
      sample = Sample.create(row.to_hash)
      puts "#{title} - #{sample.errors.full_messages.join(",")}" if sample.errors.any?
      counter += 1 if sample.persisted?
    end  
    puts "Imported #{counter} samples"
  end

  desc "Import librarie from CSV file"
  task libraries: :environment do
    filename = File.join Rails.root, "libraries.csv"
    counter = 0

    CSV.foreach(filename, headers: true) do |row|
      library = Library.create(row.to_hash)
      puts "#{name} - #{library.errors.full_messages.join(",")}" if library.errors.any?
      counter += 1 if library.persisted?
    end  
    puts "Imported #{counter} libraries"
  end
end