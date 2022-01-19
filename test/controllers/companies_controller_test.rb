require 'test_helper'

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company = create(:company)
    @company_built = build(:company)
  end

  # test 'should get index' do
  #   get companies_url, as: :json
  #   assert_response :success
  # end
  #
  # # test 'should create company' do
  # #
  # #   assert_difference('Company.count') do
  # #     post companies_url,
  # #          params: { company: @company_built.as_json }, as: :json
  # #   end
  # #   assert_response 201
  # # end
  #
  # test 'should show company' do
  #   get company_url(@company), as: :json
  #   assert_response :success
  # end
  #
  # test 'should update company' do
  #   patch company_url(@company),
  #         params: { company: @company_built.as_json }, as: :json
  #   assert_response 200
  # end
  #
  # test 'should destroy company' do
  #   assert_difference('Company.count', -1) do
  #     delete company_url(@company), as: :json
  #   end
  #
  #   assert_response 204
  # end

  test 'should create company for given engagement' do
    engagement = create(:engagement)
    assert_difference('Company.count') do
      post "/engagements/#{engagement.id}/companies", params: { company: @company_built.as_json }, as: :json
    end
    engagement2 = create(:engagement, :with_company)
    assert_no_difference ('Company.count') do
      post "/engagements/#{engagement2.id}/companies", params: { company: @company_built.as_json }, as: :json
    end
    assert_equal(engagement2.company.id + 1, JSON.parse(@response.body)['id'])
    assert_response :success
  end

  test 'should update company for given engagement' do
    engagement = create(:engagement, :with_company)
    put "/engagements/#{engagement.id}/companies/#{engagement.company.id}", params: { company: @company_built.as_json }, as: :json

    assert_response :success
    assert_equal(JSON.parse(@response.body)['full_name'], @company_built.full_name)
  end
end
