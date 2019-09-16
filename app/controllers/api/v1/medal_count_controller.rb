class Api::V1::MedalCountController < ApplicationController
  def index
    teams = Team.all
    facade = MedalCountFacade.new(teams)
    render json: MedalCountSerializer.new(facade)
  end
end
