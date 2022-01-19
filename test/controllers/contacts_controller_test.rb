require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = create(:contact)
    @contact_built = build(:contact)
    nested_engagement = create(:nested_engagement)
    @engagement_contact_url = "/engagements/#{nested_engagement.id}/contacts"
    @engagement_contact_id_url = "/engagements/#{nested_engagement.id}/contacts/#{nested_engagement.contacts[0].id}"
  end

  test 'should get index' do
    get @engagement_contact_url, as: :json
    assert_response :success
  end

  test 'should destroy multiple' do
    contacts = FactoryBot.create_list(:contact, 5)
    contact_ids = contacts.map(&:id)
    assert_difference('Contact.count', -5) do
      delete "#{@engagement_contact_url}/#{contact_ids.join(',')}", as: :json
    end

    assert_response 204
  end

  test 'should create contact for given engagement' do
    engagement = create(:engagement)
    assert_difference('Contact.count') do
      post "/engagements/#{engagement.id}/contacts", params: { contact: @contact_built.as_json }, as: :json
    end

    assert_difference ('Contact.count') do
      post @engagement_contact_url, params: { contact: @contact_built.as_json }, as: :json
    end
    assert_response :success
    # post "/engagements/#{nested_engagement.id}/contacts", params: { contact: {} }, as: :json
    # assert_response :bad_request
    @contact_built.first_name = ''
    post @engagement_contact_url, params: { contact: @contact_built.as_json }, as: :json
    assert_response 422
  end

  test 'should update contact for given engagement' do
    nested_engagement = create(:nested_engagement)
    put @engagement_contact_id_url, params: { contact: @contact_built.as_json }, as: :json

    assert_response :success
    assert_equal(JSON.parse(@response.body)['first_name'], @contact_built.first_name)
  end

  test 'should destroy contact' do
    assert_difference('Contact.count', -1) do
      delete @engagement_contact_id_url, as: :json
    end

    assert_response 204

    # assert_raise ActiveRecord::RecordNotFound do
    #   get @engagement_contact_id_url, as: :json
    # end
  end

end
