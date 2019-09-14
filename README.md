# Koroibos

## About

Welcome to _Koroibos_, an API designed to expose endpoints displaying data and statistics from the 2016 Summer Olympic Games. This is the final project for Module 4 at [Turing School of Software & Design](https://turing.io/), completed within a 48-hour timeframe.

## Local Installation

### Requirements

* [Rails 5.2.3](https://rubyonrails.org/) - Rails Version
* [Ruby 2.4.1](https://www.ruby-lang.org/en/downloads/) - Ruby Version

### Clone

```
$ git clone git@github.com:alexander-mathieu/koroibos.git
$ cd koroibos
$ bundle install
```

### Database Setup

The database is setup using Postgres. In order to complete the setup:

* Install [Postgres](https://www.postgresql.org/download/)
* Run the command `$ rails db:{create,migrate,seed}`

### Testing

The full test suite can be run with `$ bundle exec rspec`.
