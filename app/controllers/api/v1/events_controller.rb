class Api::V1::EventsController < ApplicationController
  def index
    render json: SportSerializer.new(Sport.includes(:events))
  end
end
