module Api
  class GroupsController < BaseController
    before_action :find_group, only: [:show, :update, :destroy, :join, :leave]
    before_action :authenticate, only: :join

    respond_to :json

    def index
      @groups = Group.all
      respond_with @groups
    end

    def own
      @groups = current_user.groups
      respond_with @groups
    end

    def create
      @group = Group.create group_params
      respond_with :api, @group
    end

    def show
      respond_with @group
    end

    def update
      @group.update group_params
      respond_with @group
    end

    def destroy
      @group.destroy
      respond_with @group
    end

    def search
      @groups = Group.where('name like ?', "%#{params[:q]}%").limit 10
      respond_with @groups
    end

    def join
      @group.join current_user
      respond_with :api, @group
    end

    def leave
      @group.leave current_user
      respond_with :api, @group
    end

    private

    def authenticate
      return if @group.authenticate params[:password]
      render :unauthorized, status: :forbidden
    end

    def find_group
      @group = Group.find params[:id]
    end

    def group_params
      params.require(:group).permit :name, :password, :password_confirmation
    end
  end
end
