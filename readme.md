# Event Processor with Sidekiq

This project processes a list of events using Sidekiq for background job processing. It identifies accounts with reactivations and multiple cancellations.

## Setup

1. **Clone git Repo.**:
    ```bash
    git@github.com:sajjadmurtaza/event_processor.git

2. **Install Redis**: Sidekiq requires Redis to manage job queues. Ensure Redis is installed and running.

3. **Install Bundler**: If you haven't already, install Bundler:

   ```bash
   gem install bundler
4. **Install Dependencies**: Run Bundler to install the necessary gems:
    ```bash
   bundle install
## Running the Project

1. Start Redis: Ensure Redis is running. You can start it with:
    ```bash
    bundle install

2. Start Sidekiq: Run the following command to start Sidekiq:
    ```bash
    bundle exec sidekiq -r ./main.rb -C sidekiq_config.yml

2. Rub Tests:
    ```bash
    bundle exec rspec

## Reason of using Sidekiq
- Future Growth: While the current task is simple, using Sidekiq prepares the system for future scalability.
- Asynchronous Processing



## Key Files and Classes

### `main.rb`
- Entry point for the application. Loads events and enqueues them for processing with Sidekiq.

### `event_processor.rb`
- `EventProcessor`
- Processes events to identify accounts with reactivations and multiple cancellations.

### `logger.rb`
- `EventProcessorLogger`
- Provides a logger for consistent logging throughout the application.

### `data_loader.rb`
- `DataLoader`
- Loads events from a JSON file into a Ruby data structure.

### `aggregator.rb`
- `Aggregator`
- Reads and displays aggregated results from the results file.

### `event_worker.rb`
- `EventWorker`
- Sidekiq worker that processes events in the background and writes results to a file.
