require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

$:.unshift File.expand_path("./../lib/apps/", __FILE__)
require 'scrapper.rb'

$:.unshift File.expand_path("./../lib/apps/", __FILE__)
require 'Bot_twitter.rb'

$:.unshift File.expand_path("./../lib/apps/", __FILE__)
require 'spreadsheet_scrapper.rb'

$:.unshift File.expand_path("./../lib/apps/csv/", __FILE__)
require 'csv.rb'

$:.unshift File.expand_path("./../lib/apps/Json_scrapper/", __FILE__)
require 'Json_scrapper.rb'

# début du code



hash_dep = ["http://www.annuaire-des-mairies.com/seine-saint-denis.html", "http://www.annuaire-des-mairies.com/hauts-de-seine.html", "http://www.annuaire-des-mairies.com/val-de-marne.html"]

puts "what do you want to do?"
puts " 1. get the emails from 92, 93 & 94 and put them in a Json file"
puts " 2. put them in a google spreadsheet"
puts " 3. Spam townhalls via email"
puts " 4. fetches tweeter townhall users and follows them"
puts " 5. Exit application"
a = gets.chomp

unless ['1', '2', '3', '4', '5'].include?(a); puts "wrong input" end

if a == '1' then Json.new.scrap(hash_dep) end

if a == '2' then
  Spreadsheet.new.write(Scrapper.new.result(hash_dep))
  puts "Do you want to downlad a csv version of it?(y/n)"
  b = gets.chomp
  if b == "y" then Csv.new.convert end
  end

if a == '3' then end

if a == '4' then Tweet.new.follow(Tweet.new.search) end

if a == '5' then puts "Bye!" end
