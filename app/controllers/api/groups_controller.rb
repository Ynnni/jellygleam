module Api
  class GroupsController < BaseController
    before_action :find_group, only: [:create, :show, :update, :destroy]

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
      @group = Group.where('name like ?', "%#{params[:q]}%").limit 10
      respond_with @group
    end

    private

    def find_group
      @group = Group.find params[:id]
    end

    def group_params
      params.require(:group).permit :name
    end
  end
end

