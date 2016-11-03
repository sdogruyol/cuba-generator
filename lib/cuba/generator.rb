require 'cuba/generator/version'
require 'securerandom'
require 'erb'
require 'ostruct'

module Cuba
  class Generator
    APPROOT = File.expand_path(File.dirname(__FILE__))

    def initialize(name, type)
      @project_name = name.downcase
      @type = type
      create_dir
      create_config_file
      create_cuba_file
      puts "Created your Cuba #{@type} at /#{@project_name} directory. Rock on!"
    end

    def create_dir
      Dir.mkdir(@project_name)
    end

    def create_config_file
      File.open("./#{@project_name}/config.ru", 'w+') do |file|
        file.write setup_config
      end
    end

    def create_cuba_file
      File.open("./#{@project_name}/#{@project_name}.rb", 'w+') do |file|
        file.write setup_cuba
      end
    end

    def create_postgres_file
      File.open("./#{@project_name}/postgres.rb", 'w+') do |file|
        file.write setup_postgres
      end
      File.open("./#{@project_name}/Gemfile", 'w+') do |file|
        file.write setup_gemfile
      end
    end

    private

    def setup_cuba
      if @type.to_sym == :app
        create_template 'app'
      elsif @type.to_sym == :api
        create_template 'api'
      end
    end

    def setup_config
      create_template 'rack_config'
    end

    def setup_postgres
      create_template 'postgres'
    end

    def setup_gemfile
      create_template 'gemfile'
    end

    def create_template(name)
      template = File.read File.join(APPROOT, 'templates/', "#{name}.erb")
      erb(template, {project_name: @project_name})
    end

    def erb(template, vars)
      ERB.new(template).result(OpenStruct.new(vars).instance_eval { binding })
    end
  end
end
