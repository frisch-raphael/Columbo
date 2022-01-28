# frozen_string_literal: true

class ColumboConfigController < ApplicationController

  # GET /config
  def index
    @config = Rails.configuration.columbo

    render json: @config
  end

  # Only allow a list of trusted parameters through.
  def config_params
    params.require(:config).permit
  end
end

















