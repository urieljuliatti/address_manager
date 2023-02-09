require 'csv'
require_relative 'modules/clean_zipcode'

puts 'EventManager initialized.'

class EventManager
  include CleanZipcode

  attr_accessor :csv_file

  def initialize(filepath)
    @csv_file = filepath
  end

  # headers: true skips the header
  def contents 
    CSV.open(
      @csv_file,
      headers: true,
      header_converters: :symbol
    )
  end

  def display
    contents.each do |row|
      name = row[:first_name]
      zipcode = clean(row[:zipcode])
      puts "Name: #{name} | Zipcode: #{zipcode}"
    end
  end
end

e = EventManager.new('event_attendees.csv')
p e.display