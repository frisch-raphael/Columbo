# frozen_string_literal: true

class ColumboConfig

  def self.all_entries_for(config_entry)
    assessment_types = []
    Rails.configuration.columbo[config_entry].each do |assessment_entry|
      Rails.configuration.columbo[:languages].each do |language|
        assessment_types << assessment_entry[language]
      end
    end
    assessment_types.uniq!
  end
end
