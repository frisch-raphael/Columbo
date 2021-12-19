# frozen_string_literal: true

require 'test_helper'

class EngagementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @engagement = create(:engagement, :with_company)
  end

  test 'should get index with nested company' do
    get engagements_url, as: :json
    assert_not_nil JSON.parse(@response.body)[0]['company'], 'Company not found in first engagement'
    assert_response :success
  end

  test 'should create engagement' do
    assert_difference('Engagement.count') do
      post engagements_url,
           params: { engagement: { end_date: @engagement.end_date, language: @engagement.language, scoring: @engagement.scoring, start_date: @engagement.start_date, state: @engagement.state, title: @engagement.title, is_archived: @engagement.is_archived } }, as: :json
    end

    assert_response 201
  end

  test 'should show engagement with company' do
    get engagement_url(@engagement), as: :json
    assert_response :success
    assert_not_nil JSON.parse(@response.body)['company']
  end

  test 'should update engagement' do
    patch engagement_url(@engagement),
          params: { engagement: { end_date: @engagement.end_date, language: @engagement.language, scoring: @engagement.scoring, start_date: @engagement.start_date, state: @engagement.state, title: @engagement.title, is_archived: @engagement.is_archived } }, as: :json
    assert_response 200
  end

  test 'should destroy engagement' do
    assert_difference('Engagement.count', -1) do
      delete engagement_url(@engagement), as: :json
    end

    assert_response 204
  end
end
