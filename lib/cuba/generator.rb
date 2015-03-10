require 'cuba/generator/version'
require 'securerandom'

module Cuba
  class Generator
    def initialize(name)
      @project_name = name.downcase
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
<<-EOF
require 'cuba'

# If you need extra protection.
# require 'rack/protection'
# Cuba.use Rack::Protection
# Cuba.use Rack::Protection::RemoteReferrer

Cuba.use Rack::Session::Cookie, :secret => "#{SecureRandom.base64(128)}"

# Cuba includes a plugin called Cuba::Render that provides a couple of helper methods for rendering templates.
# require "cuba/render"
# Cuba.plugin(Cuba::Render)

# This plugin uses Tilt, which serves as an interface to a bunch of different Ruby template engines
# (ERB, Haml, Sass, CoffeeScript, etc.), so you can use the template engine of your choice.
# require 'slim'
# Cuba.settings[:render][:template_engine] = 'slim'

# Cuba.settings[:render][:template_engine] = "slim"
# Cuba.settings[:render][:views] = "./views/admin/"
# Cuba.settings[:render][:layout] = "admin"

# To launch just type: 'rackup' in your console
Cuba.define do
  on get do
    on "#{@project_name}" do
      on root do
        res.write 'Hello world!'
      end
    end

    on root do
      res.redirect "/#{@project_name}"
    end
  end
end
EOF
    end

    def setup_config
<<-EOF
require "./#{@project_name}"

run Cuba
EOF
    end
  end
end
