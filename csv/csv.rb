require "google_drive"


class Csv

  def initialize
  end

  def convert()
    session = GoogleDrive::Session.from_config("config.json")

    file = session.file_by_title("THP")
    file.export_as_file("/USers/marie-charlotte/Documents/Code/The_Hacking_Project/Semaine_3/day3_Google_drive_JSon/JSON_Scrapper/db/emails.csv")

  end

end
