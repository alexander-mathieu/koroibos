class Api::V1::OlympianStatsController < ApplicationController
  def index
    render json: OlympianStatSerializer.new(OlympianStatFacade.new)
  end
end
