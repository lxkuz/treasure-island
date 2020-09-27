# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'faker'
require 'capybara/rspec'
require 'database_cleaner/active_record'
require 'selenium/webdriver'

require 'simplecov'
SimpleCov.start 'rails'

Dir[Rails.root.join('spec', 'factories', '**', '*.rb')].sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.include Capybara::DSL

  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end

  # The chromedriver-helper docs don't list this as a requirement.
  # We only know about it from other chrome driver docs.
  Capybara.javascript_driver = :chrome

  Selenium::WebDriver::Chrome.driver_path = ENV['CHROME_DRIVER_PATH']

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.include FactoryBot::Syntax::Methods
end

Dir[Rails.root.join('spec', 'shared', '**', '*.rb')].sort.each { |f| require f }
