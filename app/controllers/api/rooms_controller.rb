module Api
  class RoomsController < BaseController
    before_action :find_room, except: [:index, :create]

    respond_to :json

    def index
      @rooms = Room.all
      respond_with @rooms
    end

    def create
      @room = Room.create room_params
      respond_with :api, @room
    end

    def show
      respond_with @room
    end

    def update
      @room.update room_params
      respond_with @room
    end

    def destroy
      @room.destroy
      respond_with @room
    end

    private

    def find_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit :name
    end
  end
end

