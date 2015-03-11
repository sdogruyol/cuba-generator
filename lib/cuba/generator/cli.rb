require 'commander'
require_relative 'version'

module Russh
  class Cli
    include Commander::Methods

    def run
      program :name, 'cuba'
      program :version, VERSION
      program :description, ''

      command :new do |c|
        c.syntax = 'russh new [options]'
        c.description = 'Creates a new host'
        c.option '--type STRING', String, 'Creates an app with preferred type'
        c.action do |args, options|
          raise ArgumentError.new("Type is required!") unless options.type

        end
      end

      run!
    end
  end
end