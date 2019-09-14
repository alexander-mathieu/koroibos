require 'csv'

task import_olympic_data: :environment do
  options = {
    header_converters: :symbol,
    headers: true
  }

  CSV.foreach('./db/data/olympic_data_2016.csv', options) do |row|
    team = Team.find_or_create_by(
      name: sanitize_team_name(row[:team])
    )

    olympian = Olympian.find_or_create_by(name: row[:name]) do |new_olympian|
      new_olympian.sex = sex_enum(row[:sex])
      new_olympian.age = row[:age]
      new_olympian.height = row[:height]
      new_olympian.weight = row[:weight]
      new_olympian.team = team
    end

    sport = Sport.find_or_create_by(
      name: row[:sport]
    )

    event = Event.find_or_create_by(name: row[:event]) do |new_event|
      new_event.sport = sport
    end

    olympian.olympian_sports.find_or_create_by(sport: sport)

    olympian.olympian_events.find_or_create_by(event: event) do |new_olympian_event|
      new_olympian_event.medal = medal_enum(row[:medal])
    end
  end

  puts "Created #{Team.count} teams."
  puts "Created #{Olympian.count} Olympians."
  puts "Created #{Sport.count} sports."
  puts "Created #{OlympianSport.count} Olympian sports."
  puts "Created #{Event.count} events."
  puts "Created #{OlympianEvent.count} Olympian events."
end

def sanitize_team_name(team_name)
  team_name.split('-')[0]
end

def sex_enum(sex)
  sex == 'F' ? 0 : 1
end

def medal_enum(medal)
  case medal
    when 'Bronze'
      1
    when 'Silver'
      2
    when 'Gold'
      3
    else
      0
  end
end
