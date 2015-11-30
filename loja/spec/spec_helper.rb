# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/poltergeist'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

Capybara.asset_host="http://localhost:3000"
Capybara.save_and_open_page_path = Rails.root.join("tmp", "capybara").to_s

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.include(Capybara::DSL)
  # config.include(RSpec::Helpers::Integration, :type => :request)

  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.filter_run_excluding :broken => true

  Capybara.register_driver :poltergeist do |app|
    options = {
      :js_errors => false,
      :timeout => 120,
      :debug => false,
      :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
      :inspector => true,
    }
    Capybara::Poltergeist::Driver.new(app, options)
  end
  Capybara.javascript_driver = :poltergeist

  config.before(:suite) do
    FileUtils.remove_dir(Rails.root.join("public", "uploads/test").to_s, true)
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  config.before(:each) do
    DatabaseCleaner.start
    FactoryGirl.reload
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end