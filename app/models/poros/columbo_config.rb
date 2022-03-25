# frozen_string_literal: true

class ColumboConfig

  def self.hash_all_entries_for(config_entry)
    config_types = array_all_entries_for(config_entry)
    config_types.zip(config_types).to_h
  end

  def self.array_all_entries_for(config_entry)
    config_types = []
    Rails.configuration.columbo[config_entry].each do |config_sub_entry|
      Rails.configuration.columbo[:languages].each do |language|
        config_types << config_sub_entry[language]
      end
    end
    config_types.uniq
  end
end
