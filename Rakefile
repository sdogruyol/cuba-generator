require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'fileutils'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color', '--format progress', '--order random']
  at_exit do
  FileUtils.remove_entry_secure('myproject')
  end
end

task :default => :spec
