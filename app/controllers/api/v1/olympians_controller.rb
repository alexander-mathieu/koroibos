class Api::V1::OlympiansController < ApplicationController
  def index
    if params[:age]
      if params[:age] == 'youngest'
        olympian_data = Olympian.youngest_olympian
      else
        olympian_data = Olympian.oldest_olympian
      end
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
