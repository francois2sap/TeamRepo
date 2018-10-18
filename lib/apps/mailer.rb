require 'gmail'
require 'json'
require 'pp'

class Mailer

  def initialize

	json = File.read('/home/fde-sapo/Documents/THP/Semaine_3/TeamRepo/db/emails.JSON')

	@obj = JSON.parse(json)
end


def mail()


	puts "Adresse gmail:"
	email_adress = gets.chomp.to_s
	puts "Mot de passe:"
	password = gets.chomp.to_s
	gmail = Gmail.connect("#{email_adress}", "#{password}")
	puts "A quel nom veux-tu envoyer les mails?"
	nom = gets.chomp
	@obj.each do |k,v|
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

