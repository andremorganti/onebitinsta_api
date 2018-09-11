class Api::V1::ApiController < ApplicationController
  before_action :authenticate_user!

  rescue_from(ActiveRecord::RecordNotFound) do ||
    render(json: {message: 'Not Found'}, status: :not_found)
  end

  rescue_from(ActionController::ParameterMissing) do |parameter_missing_exception|
    render(json: {message: "Required parameter missing: #{parameter_missing_exception.param}"}, status: :bad_request)
  end
end