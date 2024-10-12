# frozen_string_literal: true

require 'rspec'
require_relative '../lib/data_loader'

RSpec.describe DataLoader do
  let(:file_path) { 'data/events.json' }
  let(:expected_data) do
    [
      { "event": 'subscription', "account": 'A001', "date": '2020-01-15' },
      { "event": 'subscription', "account": 'B0001', "date": '2020-01-23' },
      { "event": 'subscription', "account": 'C001', "date": '2020-01-25' },
      { "event": 'reactivation', "account": 'B0001', "date": '2020-04-01' },
      { "date": '2020-02-23', "account": 'B0001', "event": 'cancellation' },
      { "date": '2020-04-03', "account": 'B0001', "event": 'cancellation' },
      { "event": 'reactivation', "account": 'B0001', "date": '2020-05-12' },
      { "date": '2020-06-18', "account": 'B0001', "event": 'cancellation' },
      { "date": '2020-03-10', "account": 'C001', "event": 'cancellation' },
      { "event": 'reactivation', "account": 'C001', "date": '2020-05-17' }
    ]
  end

  it 'loads events from a JSON file' do
    expect(DataLoader.load_events(file_path)).to eq(expected_data)
  end
end
