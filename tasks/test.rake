desc "Run the full suite using 1 core"
task test: [:enforce_version,
  'spec:controller',
  'spec:model',
  'spec:routing']

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

namespace :spec do

  desc "Run the controller specs"
  RSpec::Core::RakeTask.new(:controller) do |t|
    t.pattern = "spec/controllers/**/*_spec.rb"
  end

  desc "Run the model specs"
  RSpec::Core::RakeTask.new(:model) do |t|
    t.pattern = "spec/models/**/*_spec.rb"
  end

  desc "Run the routing specs"
  RSpec::Core::RakeTask.new(:routing) do |t|
    t.pattern = "spec/routing/**/*_spec.rb"
  end

end
