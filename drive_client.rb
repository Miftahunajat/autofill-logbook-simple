require 'google_drive'

class DriveClient
  attr_accessor :rows
  def initialize
    @session = GoogleDrive::Session.from_config('config.json')
    @worksheet = @session.spreadsheet_by_key('1ycu-qNiMqPchX6Y2VI6Ny15cC4-2Ues5vyphffA03Sg').worksheets[0]
    @rows = @worksheet.rows
  end

  def get_current_kegiatan
    new_rows = @rows.dup
    new_rows.shift
    new_rows.each do |row|
      return row[1] if (Date.parse(row[2]) == Date.today)
    end
  end
end