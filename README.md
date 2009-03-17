# Yet Another Rspec Scaffolder

Yet another Rspec scaffold generator for Rails applications. Haml templates are created instead of erb, fixtures, helpers and layouts are not created, and in general only very basic code is generated.  See below for a full file listing.

## Requirements

* A Rails application (tested on 2.3+)
* Rspec and Rspec on Rails (1.2+)
* Haml

## Usage

Use script/generate:

    script/generate ya_rspec_scaffold FooBar
    
This will produce:
    
    app/controllers/foo_bars_controller.rb
    app/models/foo_bar.rb
    app/views/foo_bars/_form.html.haml
    app/views/foo_bars/edit.html.haml
    app/views/foo_bars/index.html.haml
    app/views/foo_bars/new.html.haml
    app/views/foo_bars/show.html.haml
    db/migrate/[timestamp]_create_foo_bars.rb
    spec/controllers/foo_bars_controller_spec.rb
    spec/models/foo_bar_spec.rb
    spec/views/_form.html.haml_spec.rb
    spec/views/edit.html.haml_spec.rb
    spec/views/index.html.haml_spec.rb
    spec/views/show.html.haml_spec.rb
    spec/views/new.html.haml_spec.rb
    
It will also generate restful routes in config/routes.rb:

    map.resources :foo_bar

## License

Copyright (c) 2009 Henry Poydar, released under the MIT license