class Api::V1::OlympiansController < ApplicationController
  def index
    if params[:age] && (params[:age] == 'youngest' || params[:age] == 'oldest')
      olympian_data = Olympian.youngest_or_oldest_olympian(params[:age])
    else
      olympian_data = Olympian.includes(
        :team,
        :events,
        :sports
      )
    end

    render json: OlympianSerializer.new(olympian_data)
  end
end
