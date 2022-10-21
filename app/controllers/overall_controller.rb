class OverallController < ApplicationController
  def index
    render json: OverallService.call
  end
end
