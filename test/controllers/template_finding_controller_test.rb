# frozen_string_literal: true

require 'test_helper'

class TemplateFindingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    TemplateFinding.destroy_all
    @built_template_finding = build(:template_finding)
    @created_finding_template = create(:template_finding)
  end

  test 'should get index' do
    get template_findings_url, as: :json
    assert_response :success
  end

  test 'should create template_finding' do
    assert_difference('TemplateFinding.count') do
      pp @built_template_finding.as_json
      post template_findings_url,
           params: @built_template_finding.as_json, as: :json
    end

    assert_response 201
  end

  test 'should show template_finding' do
    get template_finding_url(@created_finding_template), as: :json
    assert_response :success
  end

  test 'should update template_finding' do
    @built_template_finding.id = @created_finding_template.id
    patch template_finding_url(@created_finding_template),
          params: @built_template_finding.as_json, as: :json
    assert_response 200
  end

  test 'should destroy template_finding' do
    assert_difference('TemplateFinding.count', -1) do
      delete template_finding_url(@created_finding_template), as: :json
    end

    assert_response 204

    assert_raise ActiveRecord::RecordNotFound do
      get template_finding_url(@created_finding_template), as: :json
    end
  end

  test 'should destroy multiple' do
    template_findings = FactoryBot.create_list(:template_finding, 5)
    template_finding_ids = template_findings.map(&:id)
    test = template_findings_url(id: template_finding_ids.join(','))
    assert_difference('TemplateFinding.count', -5) do
      delete template_finding_url(template_finding_ids.join(',')), as: :json
    end

    assert_response 204
  end

end
