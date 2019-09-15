class MedalistFacade
  attr_reader :id

  def initialize(events)
    @id = nil
    @events = events
  end

  def event_medalists
    @events.map do |event|
      medalists = medalists_by_event(event.id)

      {
        event: event.name,
        medalists: format_medalists(medalists)
      }
    end
  end

  private

  def format_medalists(medalists)
    medalists.map do |medalist|
      {
        name: medalist.name,
        team: medalist.team.name,
        age: medalist.age,
        medal:
          case medalist.medal
          when 1
            'Bronze'
          when 2
            'Silver'
          when 3
            'Gold'
          end
      }
    end
  end

  def medalists_by_event(event_id)
    Olympian.event_medalists(event_id)
  end
end
