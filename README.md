# Todo API on Trails

Simple Todo RESTful JSON API with trailblazer abstraction. Implemented with Rails 5.2.2, demo: http://todo-api-ontrails.herokuapp.com

## Features
1. User registration/verification
2. Smart API versioning with default version, accepts version in headers
3. Automated API documentation

## Key points

### User registration/verification
User verification via email with queues. Scheduled background task to find and erase not verificated users. Implemented with Redis and Sidekiq bundle.

### Automated API documentation
Independent API documentation, [app_url]/api/documentation/v[version_number]

For rebuild current api doc just use:
```bash
rails api:v1:docs
```

### Data access methods
Implemented endpoints:

#### Documentation
GET ```/api/documentation/:version```

#### Users
POST ```/api/users/registration```
GET ```/api/users/verification```

## Technology summary
* Ruby 2.5.3, Rails 5.2.2, PostgreSQL 9.5.14, Redis 3.0.6
* App gems: ```trailblazer-rails, trailblazer-endpoint, reform-rails, jsonapi-rails, sidekiq```
* Documentation: Dox, Aglio
* Testing gems: ```rspec, rspec-rails, rspec_file_chef, factory_bot_rails, shoulda-matchers, faker, database_cleaner, letter_opener```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/bestwebua/todo-api-ontrails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License
The application is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
