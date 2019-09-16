class Api::V1::EventParticipationController < ApplicationController
  def index
    teams = Team.all
    facade = EventParticipationFacade.new(teams)
    render json: EventParticipationSerializer.new(facade)
  end
end
