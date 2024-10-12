# frozen_string_literal: true

require 'rspec'
require_relative '../lib/aggregator'

RSpec.describe Aggregator do
  let(:file_content) do
    {
      reactivated_accounts: %w[B0001 C001],
      multiple_cancellations: ['B0001']
    }.to_json
  end

  it 'displays aggregated results' do
    expect { Aggregator.results }.to output(
      "Accounts with at least one reactivation: [\"B0001\", \"C001\"]\n" \
      "Accounts with more than one cancellation: [\"B0001\"]\n"
    ).to_stdout
  end
end
