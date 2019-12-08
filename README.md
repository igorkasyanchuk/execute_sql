# Rails Execute SQL

Execute SQL with `execute_sql` helper inside your Rails apps. Directly in `rails console`.

 <img src="https://github.com/igorkasyanchuk/execute_sql/blob/master/docs/sample_execute_sql.png?raw=true" width="60%" />

## Usage

Simply add this gem into your Gemfile.

And for example call directly in `rails console`:

```ruby
execute_sql "select count(*) from users where age > 50"

# see below for additional options.
```

OR in your models, controllers, or other parts of app:

```ruby
ExecuteSQL.run "select count(*) from users where age > 50"

# or with different mode
# default mode: :print

# return single value
ExecuteSQL.run "select count(*) from users where age > 50", mode: :single

# return array of results
ExecuteSQL.run "select * from users where age > 50", mode: :raw

# just execute and return nil
ExecuteSQL.run "truncate table users", mode: :none
```

Sample in controller:

```ruby
class HomeController < ApplicationController
  def index
    @users = ExecuteSql.run "select * from users", mode: :raw
  end
end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'execute_sql'
```

And then execute:
```bash
$ bundle
```

## Options and modes

You can call:

In rails console use helper: `execute_sql "some SQL"`.

Or `ExecuteSql.run "some SQL"` or `ExecuteSQL.run "some SQL"`.

## TODO

- import SQL files
- travis CI
- verify with older rails
- more specs

## Contributing

You are welcome to contribute.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

Some pieces of code I took from another my gem: https://github.com/igorkasyanchuk/rails_db.

## Contributors

- pjforde1978

Big thank you.
