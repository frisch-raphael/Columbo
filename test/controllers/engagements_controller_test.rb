# frozen_string_literal: true

require 'test_helper'

class EngagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    Engagement.destroy_all
    @built_engagement = build(:engagement)
    @nested_engagement = create(:nested_engagement, :with_optionals)
    test = @nested_engagement
  end

  test 'should get index with nested company' do
    get engagements_url, as: :json
    assert_response :success
    test = JSON.parse(@response.body)[0]
    assert_not_nil JSON.parse(@response.body)[0]['company'], 'Company not found in first engagement'
  end

  test 'should create engagement' do
    assert_difference('Engagement.count') do
      post engagements_url,
           params: { engagement: @built_engagement.as_json }, as: :json
    end

    assert_response 201
  end

  test 'should show engagement with company' do
    get engagement_url(@nested_engagement), as: :json
    assert_response :success
    assert_not_nil JSON.parse(@response.body)['company']
  end

  test 'should update engagement' do
    @built_engagement.id = @nested_engagement.id
    patch engagement_url(@nested_engagement),
          params: { engagement: @built_engagement.as_json }, as: :json
    assert_response 200
  end

  test 'should destroy engagement' do
    assert_difference('Engagement.count', -1) do
      delete engagement_url(@nested_engagement), as: :json
    end

    assert_response 204

    assert_raise ActiveRecord::RecordNotFound do
      get engagement_url(@nested_engagement), as: :json
    end
  end

  test 'should destroy multiple' do
    engagements = FactoryBot.create_list(:engagement, 5)
    engagement_ids = engagements.map(&:id)
    test = engagements_url(id: engagement_ids.join(','))
    assert_difference('Engagement.count', -5) do
      delete engagement_url(engagement_ids.join(',')), as: :json
    end

    assert_response 204
  end

end
