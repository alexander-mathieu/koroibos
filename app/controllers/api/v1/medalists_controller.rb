class Api::V1::MedalistsController < ApplicationController
  def index
    events = Event.all
    facade = EventMedalistFacade.new(events)
    render json: EventMedalistSerializer.new(facade)
  end
end
