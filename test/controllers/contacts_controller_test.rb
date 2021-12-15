# frozen_string_literal: true

require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
    @company = companies(:one)
  end

  test 'should get index' do
    get company_contacts_url(@company), as: :json
    assert_response :success
    assert_equal @contact.id, JSON.parse(@response.body)[1]['id']
  end

  test 'should create contact' do
    assert_difference('Contact.count') do
      post company_contacts_url(@company),
           params: {
             contact: {
               # company_id: @contact.company_id,
               first_name: @contact.first_name,
               last_name: @contact.last_name,
               phone: @contact.phone,
               title: @contact.title
             }
           },
           as: :json
    end

    assert_response 201
    assert_equal @contact.first_name, JSON.parse(@response.body)['first_name']
  end

  test 'should show contact' do
    get company_contact_url(@company, @contact), as: :json
    assert_response :success
    assert_equal @contact.id, (JSON.parse(@response.body)['id']).to_i
  end

  test 'should update contact' do
    patch company_contact_url(@company, @contact),
          params: { contact: { company_id: @contact.company_id, first_name: @contact.first_name, last_name: @contact.last_name, phone: @contact.phone, title: @contact.title } }, as: :json
    assert_response 200
    assert_equal @contact.first_name, JSON.parse(@response.body)['first_name']
  end

  test 'should destroy contact' do
    assert_difference('Contact.count', -1) do
      delete company_contact_url(@company, @contact), as: :json
    end

    assert_response 204
  end
end
