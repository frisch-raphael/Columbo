class ContactsController < ApplicationController
  before_action :set_company
  before_action :set_contact, only: %i[show update destroy]

  # /companies/:company_id/contacts(.:format)
  def index
    @contacts = Contact.all

    render json: @contacts
  end

  def show
    render json: @contact
  end

  # POST /companies/:company_id/contacts
  def create
    @contact = Contact.new(contact_params)
    @contact.company = @company
    if @contact.save
      render json: @contact, status: :created, location: company_contact_url(@company.id, @contact.id)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/:company_id/contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /companies/:company_id/contacts/1
  def destroy
    @contact.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :title, :phone, :company_id)
  end

end
