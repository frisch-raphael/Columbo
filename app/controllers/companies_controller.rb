class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show update destroy]

  # GET /companies
  def index
    @companies = Company.all

    render json: @companies, include: ['contacts']
  end

  # GET /companies/1
  def show
    render json: @company, include: ['contacts']
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      render json: @company, status: :created, location: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      render json: @company
    else
      render json: @company.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
  end

  # POST /engagements/1/companies
  def engagement_create
    @engagement = Engagement.find(params[:id])
    @engagement.company&.destroy
    @engagement.company = Company.new(company_params)
    if @engagement.company.save
      render json: @engagement.company, status: :created, location: @engagement.company
    else
      render json: @engagement.company.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(:website, :short_name, :full_name, :city, :address)
  end
end
