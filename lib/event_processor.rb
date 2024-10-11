# frozen_string_literal: true

require_relative 'logger'
require_relative 'aggregator'

# EventProcessor: Processes each event and updates account statuses
class EventProcessor
  attr_reader :reactivated_accounts, :cancellation_counts, :events, :logger

  def initialize(events)
    @events = events
    @reactivated_accounts = Set.new
    @cancellation_counts = Hash.new(0)
    @logger = EventProcessorLogger.logger
  end

  def process_events
    events.each { |event| process_event(event) }
  end

  def results
    {
      reactivated_accounts: reactivated_accounts.to_a,
      multiple_cancellations: cancellation_counts.filter_map { |account, count| account if count > 1 }
    }
  end

  private

  def process_event(event)
    account = event['account']
    event_type = event['event']

    return reactivated_accounts.add(account) if event_type == 'reactivation'
    return cancellation_counts[account] += 1 if event_type == 'cancellation'

    logger.warn("Unknown event type: #{event_type}")
  rescue StandardError => e
    logger.error("Error processing event: #{event}, Error: #{e.message}")
  end
end
