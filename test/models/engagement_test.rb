require "test_helper"

class EngagementTest < ActiveSupport::TestCase
  def setup
    @engagement = build(:engagement)
  end

  test 'invalid without archived status' do
    @engagement.is_archived = nil
    refute @engagement.valid?, 'saved company without archived status'
  end
end
