module Api
  class TripsController < BaseController
    before_action :find_group, except: :index
    before_action :find_trip, only: [:show, :update, :destroy]

    respond_to :json

    def index
      @trips = Trip.joins(:group).where(groups: { id: params[:id] })
      respond_with @trips
    end

    def create
      @trip = @group.trips.create trip_params
      respond_with :api, @group, @trip
    end

    def show
      respond_with @trip
    end

    def update
      @trip.update trip_params
      respond_with @trip
    end

    def destroy
      @trip.destroy
      respond_with @trip
    end

    private

    def find_group
      @group = Group.find params[:group_id]
    end

    def find_trip
      @trip = @group.trips.find params[:id]
    end

    def trip_params
      params.require(:trip).permit!
    end
  end
end

