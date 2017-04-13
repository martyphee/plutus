require 'simplecov'

SimpleCov.start do
  add_filter 'spec/'
  add_filter 'features/'
  add_filter 'bundle/' # for Travis
end

if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

ENV['RAILS_ENV'] = 'test'

require 'rails'
ENV['RAILS_ROOT'] = File.expand_path("../rails/rails-#{Rails.version}", __FILE__)

# Create the test app if it doesn't exists
unless File.exists?(ENV['RAILS_ROOT'])
  system 'rake setup'
end

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path(File.dirname(__FILE__) + "/rails/rails-#{Rails.version}/config/environment")

require Rails.root.join('db/schema').to_s
require 'rspec/rails'

require 'active_record'
# ActiveAdmin.application.load_paths = [ENV['RAILS_ROOT'] + "/app"]

require ENV['RAILS_ROOT'] + '/config/environment'

$: << File.expand_path(File.dirname(__FILE__) + '/../lib/')
require 'plutus'

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

require 'factory_girl'

FactoryGirl.definition_file_paths = [File.expand_path('../factories', __FILE__)]

# ActiveSupport::Dependencies.autoload_paths << File.expand_path(File.dirname(__FILE__) + "../../app/models")
# binding.pry

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  config.before(:suite) do
    begin
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean_with(:truncation)
      DatabaseCleaner.start
    ensure
      DatabaseCleaner.clean
    end
  end

  config.before(:all) do
    FactoryGirl.reload
    FactoryGirl.factories.clear
    FactoryGirl.sequences.clear
    FactoryGirl.traits.clear
    FactoryGirl.find_definitions
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.mock_with :rspec

  # config.infer_base_class_for_anonymous_controllers = false

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!

  config.include FactoryGirl::Syntax::Methods

end