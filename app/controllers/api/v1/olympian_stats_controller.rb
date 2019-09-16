class Api::V1::OlympianStatsController < ApplicationController
  def index
    facade = OlympianStatFacade.new
    render json: OlympianStatSerializer.new(facade)
  end
end
