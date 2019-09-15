class Api::V1::MedalistsController < ApplicationController
  def index
    events = Event.all
    facade = MedalistFacade.new(events)
    render json: MedalistSerializer.new(facade)
  end
end
