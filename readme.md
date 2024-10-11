# Event Processor with Sidekiq

This project processes a list of events using Sidekiq for background job processing. It identifies accounts with reactivations and multiple cancellations.

## Setup

1. **Install Redis**: Sidekiq requires Redis to manage job queues. Ensure Redis is installed and running.

2. **Install Bundler**: If you haven't already, install Bundler:

   ```bash
   gem install bundler
3. **Install Dependencies**: Run Bundler to install the necessary gems:
    ```bash
   bundle install
## Running the Project

1. Start Redis: Ensure Redis is running. You can start it with:
    ```bash
    bundle install

2. Start Sidekiq: Run the following command to start Sidekiq:
    ```bash
    bundle exec sidekiq -r ./main.rb -C sidekiq_config.yml
