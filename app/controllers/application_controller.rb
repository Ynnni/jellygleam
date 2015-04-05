class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  def routing_error
    head :method_not_allowed
  end
end
