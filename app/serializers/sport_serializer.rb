class SportSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name

  attribute :events do |object|
    object.events.map do |event|
      event.name
    end
  end
end
