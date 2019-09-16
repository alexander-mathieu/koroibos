class SportEventSerializer
  include FastJsonapi::ObjectSerializer
  set_type :sport

  attributes :name

  attribute :events do |object|
    object.events.map do |event|
      event.name
    end
  end
end
