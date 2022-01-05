# frozen_string_literal: true

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  def setup
    @company = build(:company)
  end

  # test 'valid Company' do
  #   assert @company.valid?, 'Company object not valid'
  # end
  #
  # test 'invalid without full or last names' do
  #   @company.full_name = nil
  #   refute @company.valid?, 'saved company without a full name'
  #   assert_not_nil @company.errors[:full_name], 'no validation error for fullname present'
  # end

  # test 'delete company also destroys contacts' do
  #   @company_with_contacts = create(:company_with_contacts)
  #
  #   contacts = @company_with_contacts.contacts
  #   assert_equal contacts.size, 0
  # end

end
