# frozen_string_literal: true

require_relative 'lib/data_loader'
require_relative 'lib/workers/event_worker'

# Load events from the JSON file
events = DataLoader.load_events('data/events.json')

# Enqueue all events for processing
EventWorker.perform_async(events.to_json)
