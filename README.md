
# cuba-generator-duo

cuba-generator-duo is a generator to help creating Cuba projects.

[Cuba](https://github.com/soveran/cuba) is a micro-framework for Ruby based on Rack.

## Installation

    gem install cuba-generator-duo

## Usage

    cuba new [projectName] [options]

Additionally you can specify the type of your app via ***--type*** . E.g to generate an API starting point.

    cuba new [projectName] --type api

To generate an application with a Postgresql or Sqlite configuration setup use ***-database*** option (via Datamapper)

    cuba new [projectName] --database postgresql
    

    cuba new [projectName] --database sqlite
    
    
    cuba new [projectName] --database mysql

By default ***--type*** is 'app'.

## Contributing

1. Fork it ( https://github.com/rangeroob/cuba-generator-duo )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Thanks

This project is inspired from [cuba-libre](https://github.com/gdurelle/cuba-libre).
And forked from [cuba-generator](https://github.com/sdogruyol/cuba-generator).
