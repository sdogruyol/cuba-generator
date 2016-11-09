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
        c.option '--database STRING', String, 'Setups a database configuration with DataMapper'
        c.action do |args, options|
          if options.type
            generator = Cuba::Generator.new(ARGV[1], options.type)
            generator.create_postgres_file if options.database == 'postgresql'
          else
            generator = Cuba::Generator.new(ARGV[1], :app)
            generator.create_postgres_file if options.database == 'postgresql'
          end
        end
      end
      run!
    end
  end
end
