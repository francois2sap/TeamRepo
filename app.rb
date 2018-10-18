require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

$:.unshift File.expand_path("./../lib", __FILE__)
require 'scrapper.rb'

$:.unshift File.expand_path("./../spreadsheet_scrapper/", __FILE__)
require 'spreadsheet_scrapper.rb'

$:.unshift File.expand_path("./../csv/", __FILE__)
require 'csv.rb'


def json_scrapper(hash)
  File.open("/Users/marie-charlotte/Documents/Code/The_Hacking_Project/Semaine_3/day4_Scrapping_email_sending/TeamRepo/db/emails.JSON", "w") do |f|
    f.write((Scrapper.new.perform(hash)).to_json)
  end
end

hash_dep = ["http://www.annuaire-des-mairies.com/seine-saint-denis.html", "http://www.annuaire-des-mairies.com/hauts-de-seine.html", "http://www.annuaire-des-mairies.com/val-de-marne.html"]

# json_scrapper(hash_dep)

Spreadsheet.new.write(Scrapper.new.perform(hash))

# Csv.new.convert
