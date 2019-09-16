class Api::V1::EventParticipationController < ApplicationController
  def index
    teams = Team.all
    facade = TeamEventParticipationFacade.new(teams)
    render json: TeamEventParticipationSerializer.new(facade)
  end
end
