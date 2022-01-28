# frozen_string_literal: true

require_relative '../models/poros/columbo_config'

class TemplateFinding < ApplicationRecord
  validates :title, presence: true
  enum assessment_type: ColumboConfig.all_entries_for(:assessment_types)
  enum finding_type: ColumboConfig.all_entries_for(:finding_types)
end
