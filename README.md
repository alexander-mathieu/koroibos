# Koroibos

## About

Welcome to _Koroibos_, an API designed to expose endpoints displaying data and statistics from the 2016 Summer Olympic Games. This is the final project for Module 4 at [Turing School of Software & Design](https://turing.io/), completed within a 48-hour timeframe.

## Endpoints

### `GET /api/v1/olympians`

Returns a list of all Olympians in the database, with their name, team, age, sport(s) and total medals won.

Example of expected response:
```
{
  "data": [
    {
      "id": "1",
      "type": "olympian",
      "attributes": {
        "id": 1,
        "age": 22,
        "name": "Andreea Aanei",
        "sports": [
          {
            "id": 1,
            "name": "Weightlifting",
            "created_at": "2019-09-14T23:51:14.066Z",
            "updated_at": "2019-09-14T23:51:14.066Z"
          }
        ],
        "team": {
          "id": 1,
          "name": "Romania",
          "created_at": "2019-09-14T23:51:14.027Z",
          "updated_at": "2019-09-14T23:51:14.027Z"
        },
        "total_medal_count": 0
      }
    }
  ]
}
```

Also accepts the query param `age`. `?age=youngest` will return the youngest Olympian (example below), while `?age=oldest` will return the oldest Olympian.

Example of expected response:
```
{
  "data": {
    "id": "2190",
    "type": "olympian",
    "attributes": {
      "id": 2190,
      "age": 13,
      "name": "Ana Iulia Dascl",
      "sports": [
        {
          "id": 18,
          "name": "Swimming",
          "created_at": "2019-09-14T23:51:15.082Z",
          "updated_at": "2019-09-14T23:51:15.082Z"
        }
      ],
      "team": {
        "id": 1,
        "name": "Romania",
        "created_at": "2019-09-14T23:51:14.027Z",
        "updated_at": "2019-09-14T23:51:14.027Z"
      },
      "total_medal_count": 0
    }
  }
}
```

### `GET /api/v1/olympian_stats`

Returns statistics for all Olympians, such as total Olympic competitors, average height, weight and age.

Example of expected response:
```
{
  "data": {
    "id": null,
    "type": "olympian_stats",
    "attributes": {
      "total_competing_olympians": 2850,
      "average_age": "26.37",
      "average_height": {
        "unit": "cm",
        "female_olympians": "179.52",
        "male_olympians": "167.2"
      },
      "average_weight": {
        "unit": "kg",
        "female_olympians": "77.87",
        "male_olympians": "61.41"
      }
    }
  }
}
```

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
* Run the command `$ rails db:{create,migrate}`

Once initial setup is complete, run the following command to populate the database:
```
$ bundle exec rake import_olympic_data
```

### Testing

The full test suite can be run with `$ bundle exec rspec`.
