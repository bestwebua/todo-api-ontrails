# Todo API on Trails

Simple Todo RESTful JSON API with trailblazer abstraction and documentation. Implemented with Rails 5.2.2, demo: http://todo-api-ontrails.herokuapp.com

## Features
1. User registration
2. Independent API documentation, [app_url]/api/documentation/v[version_number]
3. Smart API versionization with default version, accepts version in headers
4. User verification by email with queues via Redis and Sidekiq bundle
5. Scheduled background task to find and erase not verificated users

For rebuild current api doc just use:
```bash
rails api:v1:docs
```

## Technology summary

* Ruby 2.5.3, Rails 5.2.2, PostgreSQL 9.5.14, Redis 3.0.6
* App gems: ```trailblazer-rails, trailblazer-endpoint, reform-rails, jsonapi-rails, sidekiq```
* Documentation: Dox, Aglio
* Testing gems: ```rspec, rspec-rails, rspec_file_chef, factory_bot_rails, shoulda-matchers, faker, database_cleaner, letter_opener```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bestwebua/todo-api-ontrails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The application is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
