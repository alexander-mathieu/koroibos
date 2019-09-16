class Api::V1::MedalCountController < ApplicationController
  def index
    teams = Team.all
    facade = TeamMedalCountFacade.new(teams)
    render json: TeamMedalCountSerializer.new(facade)
  end
end
