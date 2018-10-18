require 'twitter'
require 'dotenv'
require 'json'

Dotenv.load

class Tweet

def initialize
end

#search for people who tweeted about a town and adds it to spreadsheet
def search()
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_API_KEY"]
    config.consumer_secret     = ENV["TWITTER_API_SECRET"]
    config.access_token        = ENV["TWITTER_TOKEN_KEY"]
    config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
  end

  json = File.read('/Users/marie-charlotte/Documents/Code/The_Hacking_Project/Semaine_3/day4_Scrapping_email_sending/TeamRepo/db/emails.JSON')
  hash = JSON.parse(json)
  to_follow = []

  hash.each do |k, v|
    client.search("mairie #{k}", result_type: "recent").take(1).each do |tweet|
    to_follow << "#{tweet.user.screen_name}"
  end
end
return to_follow
end


# Follow all people from an ARRAY > array of string of pseudos or IDs not in string
def follow(arr)
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_API_KEY"]
    config.consumer_secret     = ENV["TWITTER_API_SECRET"]
    config.access_token        = ENV["TWITTER_TOKEN_KEY"]
    config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
  end
  arr.each {|pseudo| client.follow(pseudo)}
  puts "you've followed #{arr}!"
end

end

Tweet.new.follow(Tweet.new.search)
