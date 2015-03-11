require 'commander'
require_relative 'version'
require_relative '../generator'

module Cuba
  class Cli
    include Commander::Methods

    def run
      program :name, 'cuba'
      program :version, Cuba::Generator::VERSION
      program :description, 'Application Generator for Cuba framework.'

      command :new do |c|
        c.syntax = 'cuba new [options]'
        c.description = 'Creates a new Cuba app'
        c.option '--type STRING', String, 'Creates an app with preferred type'
        c.action do |args, options|
          if options.type
            Cuba::Generator.new(ARGV[1], options.type)
          else
            Cuba::Generator.new(ARGV[1], :app)
          end
        end
      end
      run!
    end
  end
end