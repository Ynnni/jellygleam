module Api
  class TripsController < BaseController
    before_action :find_trip, only: [:show, :update, :destroy]

    def index
    end

    def create
    end

    def show
    end

    def update
    end

    def delete
    end

    private

    def trip_params
      params.require(:trip).permit!
    end
  end
end

