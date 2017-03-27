# WebiniusCMS
WebiniusCMS is a Rails CMS Engine for developers running on PostgreSQL.

Version 0.6.0

## Install into an existing Rails 5+ project:

You need Rails 5+ to run WebiniusCMS.

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
$ bin/rails webinius_cms:install:migrations
```

Add this to your seeds.rb file:

```ruby
WebiniusCms::Engine.load_seed
```

and run your migrations and seed task as usual:

```bash
$ bin/rails db:migrate
$ bin/rails db:seed
```

The admin section is available at localhost:3000/login

## How to use WebiniusCMS Pages in your views:
TODO

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).