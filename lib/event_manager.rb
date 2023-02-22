require 'csv'
require 'erb'
require_relative 'modules/clean_zipcode'
require_relative 'modules/clean_phone'
require_relative 'modules/legislator'
require_relative 'modules/form_letter'
require_relative 'template'

puts 'EventManager initialized.'

class EventManager
  include CleanZipcode
  include Legislator
  include FormLetter
  include CleanPhone
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
    erb_template = Template.new('form_letter.erb').erb_template

    contents.each do |row|
      id = row[0]
      name = row[:first_name]
      zipcode = clean(row[:zipcode])
      phone_number = phone_number_parser(row[:homephone])
      legislators = legislators_by_zipcode(zipcode)
      puts "Name: #{name} | Zipcode: #{zipcode}  | Legislator: #{legislators} | Phone Number: #{phone_number}"

      form_letter = erb_template.result(binding)

      save_thank_you_letter(id, form_letter)
    end
  end
end

e = EventManager.new('event_attendees.csv')
p e.display
