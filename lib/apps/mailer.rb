require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'fileutils'
require 'json'
require 'pp'
require 'dotenv'
Dotenv.load('mdp.env')
$:.unshift File.expand_path("./../db", __FILE__)

<<<<<<< HEAD
json = File.read('~//db/emails.JSON')
=======
class Mailer

  def initialize

json = File.read('/Users/marie-charlotte/Documents/Code/The_Hacking_Project/Semaine_3/day4_Scrapping_email_sending/TeamRepo/db/emails.JSON')
>>>>>>> d544e3042f964b267bf2e70cf662a4d6863b2a76
obj = JSON.parse(json)

OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'.freeze
APPLICATION_NAME = 'Gmail API Ruby Quickstart'.freeze
CREDENTIALS_PATH = 'credentials.json'.freeze
TOKEN_PATH = 'token.yaml'.freeze
SCOPE = Google::Apis::GmailV1::AUTH_GMAIL_READONLY
end


def authorize
  client_id = Google::Auth::ClientId.from_file(CREDENTIALS_PATH)
  token_store = Google::Auth::Stores::FileTokenStore.new(file: TOKEN_PATH)
  authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE, token_store)
  user_id = 'default'
  credentials = authorizer.get_credentials(user_id)
  if credentials.nil?
    url = authorizer.get_authorization_url(base_url: OOB_URI)
    puts 'Open the following URL in the browser and enter the ' \
         "resulting code after authorization:\n" + url
    code = gets
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI
    )
  end
  credentials
end


def mail()

# Initialize the API
service = Google::Apis::GmailV1::GmailService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize
require 'gmail'
puts "Adresse gmail:"
email_adress = gets.chomp.to_s
puts "Mot de passe:"
password = gets.chomp.to_s
gmail = Gmail.connect("#{email_adress}", "#{password}")

puts "A quel nom veux-tu envoyer les mails?"
nom = gets.chomp

obj.each do |k,v|

message = "Bonjour,
Je m'appelle #{nom}, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de ntore école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.

Déjà 500 personnes sont passées par The Hacking Project. Est-ce que la mairie de #{k} veut changer le monde avec nous ?


Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80"

email = gmail.compose do
 to "#{v[1]}"
 subject "#{k}: Devenez ambassadeurs de The Hacking Project"
 body "#{message}"
end
gmail.deliver(email)
end
end

end
