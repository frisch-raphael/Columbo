class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show update destroy]
  before_action :set_engagement

  # GET /engagements/1/contacts
  def engagement_index
    @contacts = @engagement.contacts

    render json: @contacts
  end

  # POST /engagements/1/contacts
  def engagement_create
    contact = @engagement.contacts.new(contact_params)

    if contact.save
      render json: contact, status: :created
    else
      render json: contact.errors, status: :unprocessable_entity
    end
  end

  # PUT /engagements/1/contacts/1
  def engagement_update
    contact = Contact.find(params[:contact_id])

    if contact.update(contact_params)
      render json: contact
    else
      render json: contact.errors, status: :unprocessable_entity
    end
  end

  def engagement_destroy
    @contacts = Contact.where(id: params[:contact_id].split(',')).destroy_all
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:contact_id])
  end

  def set_engagement
    @engagement = Engagement.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :title, :phone)
  end

end
