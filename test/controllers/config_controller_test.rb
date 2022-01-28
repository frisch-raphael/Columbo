# frozen_string_literal: true
require 'test_helper'

class ColumboConfigControllerTest < ActionDispatch::IntegrationTest

  test 'should get config' do
    get '/config', as: :json
    assert_response :success
  end

end
