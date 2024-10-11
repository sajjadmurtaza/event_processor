# frozen_string_literal: true

require 'rspec'
require_relative '../lib/data_loader'

RSpec.describe DataLoader do
  let(:file_path) { 'data/events.json' }
  let(:expected_data) do
    [
      { event: 'reactivation', account: 'B0001' },
      { event: 'cancellation', account: 'B0001' }
    ]
  end

  before do
    allow(File).to receive(:read).with(file_path).and_return(expected_data.to_json)
  end

  it 'loads events from a JSON file' do
    expect(DataLoader.load_events(file_path)).to eq(expected_data)
  end
end
