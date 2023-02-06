puts 'EventManager initialized.'

# read the lines
lines = File.readlines('event_attendees.csv')

lines.each_with_index do |line,index|
  # skipping the header
  next if index.zero?

  columns = line.split(',')
  name = columns[2]
  puts name
end
