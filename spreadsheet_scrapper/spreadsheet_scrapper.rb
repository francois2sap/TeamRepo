require "google_drive"


class Spreadsheet

  def initialize
  end

  def write(hash)
  session = GoogleDrive::Session.from_config("config.json")
  ws = session.spreadsheet_by_key("1MSf9hQ9RgzZ-6_ioP0w45BH0wdM1exx1TKg8XJcoRAs").worksheets[0]

  b = 1
  hash.each do |k, v|
    ws[b, 1] = k
    ws[b, 2] = v[0]
    ws[b, 3] = v[1]
    ws.save
    b += 1
    end
  end

end
