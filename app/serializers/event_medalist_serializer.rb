class EventMedalistSerializer
  include FastJsonapi::ObjectSerializer
  set_type :event
  set_id :id

  attributes :event_medalists
end
