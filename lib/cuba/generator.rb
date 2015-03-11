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

    private

    def setup_cuba
      path = if @type.to_sym == :app
        File.read File.join(APPROOT, './templates/app.erb')
      elsif @type.to_sym == :api
        File.read File.join(APPROOT, './templates/api.erb')
      end
        erb(path, {project_name: @project_name})
    end

    def setup_config
      path = File.read File.join(APPROOT, './templates/rack_config.erb')
      erb(path, {project_name: @project_name})
    end

    def erb(template, vars)
      ERB.new(template).result(OpenStruct.new(vars).instance_eval { binding })
    end
  end
end
