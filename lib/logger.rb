# frozen_string_literal: true

require 'logger'

# logging module for the EventProcessor
module EventProcessorLogger
  def self.logger
    @logger ||= ::Logger.new($stdout).tap do |log|
      log.level = Logger::INFO
    end
  end
end
