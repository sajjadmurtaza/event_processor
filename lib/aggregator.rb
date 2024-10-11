# frozen_string_literal: true

require 'json'

# Aggregator: Reads and displays results from the results file
class Aggregator
  def self.results
    file_content = File.read('results.json')
    result = JSON.parse(file_content, symbolize_names: true)

    puts "Accounts with at least one reactivation: #{result[:reactivated_accounts]}"
    puts "Accounts with more than one cancellation: #{result[:multiple_cancellations]}"
  end
end
