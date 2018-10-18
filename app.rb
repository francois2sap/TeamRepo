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

$:.unshift File.expand_path("./../Json_scrapper/", __FILE__)
require 'Json_scrapper.rb'

# début du code



hash_dep = ["http://www.annuaire-des-mairies.com/seine-saint-denis.html", "http://www.annuaire-des-mairies.com/hauts-de-seine.html", "http://www.annuaire-des-mairies.com/val-de-marne.html"]

# Json.new.scrap(hash_dep)
# Spreadsheet.new.write(Scrapper.new.result(hash_dep))
# Csv.new.convert
