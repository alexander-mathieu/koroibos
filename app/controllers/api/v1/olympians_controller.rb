class Api::V1::OlympiansController < ApplicationController
  def index
    render json: OlympianSerializer.new(
      Olympian.includes(
        :team,
        :events,
        :sports
        )
      )
  end
end
