module Api
  class BaseController < ApplicationController
    before_action :authenticate_user!

    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActionController::UnknownFormat, with: :unknown_format

    private

    def not_found
      head :not_found
    end

    def unknown_format
      head :not_acceptable
    end
  end
end