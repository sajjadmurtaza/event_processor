# frozen_string_literal: true

require 'rspec'
require_relative '../lib/event_processor'

RSpec.describe EventProcessor do
  let(:events) do
    [
      { 'event' => 'reactivation', 'account' => 'B0001' },
      { 'event' => 'cancellation', 'account' => 'B0001' },
      { 'event' => 'cancellation', 'account' => 'B0001' },
      { 'event' => 'reactivation', 'account' => 'C001' }
    ]
  end

  subject { described_class.new(events) }

  before do
    allow(EventProcessorLogger).to receive(:logger).and_return(double('Logger', warn: nil, error: nil))
    subject.process_events
  end

  it 'identifies accounts with at least one reactivation' do
    expect(subject.results[:reactivated_accounts]).to contain_exactly('B0001', 'C001')
  end

  it 'identifies accounts with more than one cancellation' do
    expect(subject.results[:multiple_cancellations]).to contain_exactly('B0001')
  end
end
