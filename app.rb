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

# début du code


def json_scrapper(hash)
  File.open("/Users/marie-charlotte/Documents/Code/The_Hacking_Project/Semaine_3/day4_Scrapping_email_sending/TeamRepo/db/emails.JSON", "w") do |f|
    f.write((Scrapper.new.perform(hash)).to_json)
  end
end

def perform()
puts "what do you want to do ?"
puts "JSON scrap (1), google sheet scrap (2), google sheet csv download(3)"
a = gets.chomp

if a == 1 then json_scrapper(hash_dep) end
if a == 2 then Spreadsheet.new.write(Scrapper.new.perform(hash_dep)) end
if a == 3 then Csv.new.convert end
end

hash_dep = ["http://www.annuaire-des-mairies.com/seine-saint-denis.html", "http://www.annuaire-des-mairies.com/hauts-de-seine.html", "http://www.annuaire-des-mairies.com/val-de-marne.html"]

Spreadsheet.new.write(Scrapper.new.perform(hash_dep))
