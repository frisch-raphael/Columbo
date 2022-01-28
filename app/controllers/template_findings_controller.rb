# frozen_string_literal: true

class TemplateFindingsController < ApplicationController
  before_action :set_template_finding, only: %i[show update destroy]

  # GET /template_findings
  def index
    @template_findings = TemplateFinding.all

    render json: @template_findings
  end

  # GET /template_findings/1
  def show
    render json: @template_finding
  end

  # POST /template_findings
  def create
    param! 'title', String, required: true
    @template_finding = TemplateFinding.new(template_finding_params)
    if @template_finding.save
      render json: @template_finding, status: :created, location: @template_finding
    else
      render json: @template_finding.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /template_findings/1
  def update
    if @template_finding.update(template_finding_params)
      render json: @template_finding
    else
      render json: @template_finding.errors, status: :unprocessable_entity
    end
  end

  # DELETE /template_findings/1
  def destroy
    @template_findings = TemplateFinding.where(id: params[:id].split(',')).destroy_all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_template_finding
    @template_finding = TemplateFinding.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def template_finding_params
    params.require(:template_finding).permit(:title, :assessment_type, :description, :finding_type, :hacker_profile, :remediation_effort, :remediation_description)
  end
end

















