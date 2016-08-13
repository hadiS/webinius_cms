# Webinius CMS

Version 0.3.0

# WebiniusCMS
WebiniusCMS is a Rails CMS Engine for developers running on PostgreSQL.

## Installation

You need Rails 5+ to run WebiniusCMS. Create a new Rails App. Create a PostgreSQL Database.

Then add this line to your application's Gemfile:

```ruby
gem 'webinius_cms', git: "https://github.com/hadiS/webinius_cms.git"
```

And then execute:
```bash
$ bundle
```

Add this line in your routes file (at the end inside the Rails.application.routes.draw block):

```ruby
mount WebiniusCms::Engine, at: '/', as: 'webinius_cms'
```

To copy the migrations of the Engine inside your Rails App execute:
```bash
$ bin/rails app:webinius_cms:install:migrations
```

Add this to your seeds.rb file:

```ruby
WebiniusCms::Engine.load_seed
```

and run your seed task.

Then run your migrations as usual:
```bash
$ bin/rails db:migrate
```

The admin section is available at localhost:3000/login

## How to use WebiniusCMS Pages in your views:
TODO

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).