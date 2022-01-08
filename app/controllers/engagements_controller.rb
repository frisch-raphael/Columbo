# frozen_string_literal: true

class EngagementsController < ApplicationController
  before_action :set_engagement, only: %i[show update destroy]

  # GET /engagements
  def index
    @engagements = Engagement.all

    render json: @engagements, include: ['company']
  end

  # GET /engagements/1
  def show
    render json: @engagement, include: ['company']
  end

  # POST /engagements
  def create
    @engagement = Engagement.new(engagement_params)

    if @engagement.save
      render json: @engagement, status: :created, location: @engagement
    else
      render json: @engagement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /engagements/1
  def update
    if @engagement.update(engagement_params)
      render json: @engagement
    else
      render json: @engagement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /engagements/1
  def destroy
    @engagements = Engagement.where(id: params[:id].split(',')).destroy_all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_engagement
    @engagement = Engagement.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def engagement_params
    params.require(:engagement).permit(:title, :assessment_type, :start_date, :end_date, :scoring, :language, :state)
  end
end

















