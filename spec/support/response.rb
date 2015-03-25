module Response
  module JsonHelpers
    def json
      @json ||= JSON.parse(response.body).with_indifferent_access
    end
  end
end

RSpec.configure do |config|
  config.include Response::JsonHelpers, type: :request
end
