require "google_drive"


class Csv

  def initialize
  end

  def convert()
    session = GoogleDrive::Session.from_config("config.json")

# importe le fichier avec les addresses mail dans mon dossier du projet
    file = session.file_by_title("THP")
    file.export_as_file("/Users/marie-charlotte/Documents/Code/The_Hacking_Project/Semaine_3/day4_Scrapping_email_sending/TeamRepo/csv/emails.csv")

  end

end
