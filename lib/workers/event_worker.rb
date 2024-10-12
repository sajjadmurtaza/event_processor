# frozen_string_literal: true

require 'sidekiq'
require 'json'
require_relative '../event_processor'

# EventWorker: To Processes events in the background
class EventWorker
  include Sidekiq::Worker
  sidekiq_options retry: 2, dead: true

  def perform(events)
    events = JSON.parse(events)

    processor = EventProcessor.new(events)
    processor.process_events

    results = processor.results

    # Write results to a file
    File.open('results.json', 'w') do |file|
      file.puts(results.to_json)
    end

    # Display aggregated results
    puts '----------------------------------------------------------------'
    puts Aggregator.results
    puts '----------------------------------------------------------------'
  end
end
