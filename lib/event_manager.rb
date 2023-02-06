puts 'EventManager initialized.'

lines = File.readlines('event_attendees.csv')
lines.each do |line|
  # separate the columns into an array
  columns = line.split(',')
  p columns
end
