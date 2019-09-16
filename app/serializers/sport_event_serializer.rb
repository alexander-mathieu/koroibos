class SportEventSerializer
  include FastJsonapi::ObjectSerializer
  set_type :sports

  attributes :name

  attribute :events do |object|
    object.events.map do |event|
      event.name
    end
  end
end
