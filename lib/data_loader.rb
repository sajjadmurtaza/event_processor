# frozen_string_literal: true

require 'json'

# DataLoader: Loads events from a JSON file and returns them as an array of hashes
class DataLoader
  def self.load_events(file_path)
    file_content = File.read(file_path)
    JSON.parse(file_content, symbolize_names: true)
  end
end
