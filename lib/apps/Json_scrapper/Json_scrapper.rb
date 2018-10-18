require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'json'

class Json

  def initialize
  end

# renvoie le resultat du scrapping de scrapper.rb dans le fichier emails.Json
  def scrap(hash)
    File.open("/Users/marie-charlotte/Documents/Code/The_Hacking_Project/Semaine_3/day4_Scrapping_email_sending/TeamRepo/db/emails.JSON", "w") do |f|
      f.write((Scrapper.new.result(hash)).to_json)
    end
  end

end
