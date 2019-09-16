class Api::V1::EventsController < ApplicationController
  def index
    sports = Sport.includes(:events)
    render json: SportEventSerializer.new(sports)
  end
end
