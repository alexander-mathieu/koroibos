![Koroibos Screenshot](/public/images/koroibos_screenshot.png)

# Koroibos

## About

Welcome to _Koroibos_, a JSON:API designed to expose endpoints displaying data and statistics from the 2016 Summer Olympic Games. This is the final project for Module 4 at [Turing School of Software & Design](https://turing.io/), completed within a 48-hour timeframe.

The deployed site's endpoints can be consumed at:

https://koroibos-final.herokuapp.com/

The project board can be viewed [here](https://github.com/alexander-mathieu/koroibos/projects/1/).

## Schema

![Koroibos Schema](/public/images/schema.png)

## Endpoints

### `GET /api/v1/olympians`

Returns a list of all Olympians in the database, with their name, team, age, sport(s) and total medals won.

**Example of expected response:**
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

**Example of expected response:**
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

**Example of expected response:**
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

### `GET /api/v1/events`

Returns a list of all events, broken down by sport.

**Example of expected response:**
```
{
  "data": [
    {
      "id": "1",
      "type": "sport",
      "attributes": {
          "name": "Weightlifting",
          "events": [
            "Weightlifting Women's Super-Heavyweight",
            "Weightlifting Men's Heavyweight",
            "Weightlifting Men's Middleweight",
            "Weightlifting Men's Middle-Heavyweight",
            "Weightlifting Men's Featherweight",
            "Weightlifting Women's Flyweight",
            "Weightlifting Women's Middleweight",
            "Weightlifting Women's Lightweight",
            "Weightlifting Men's Lightweight",
            "Weightlifting Men's Super-Heavyweight",
            "Weightlifting Men's Light-Heavyweight",
            "Weightlifting Women's Heavyweight",
            "Weightlifting Women's Light-Heavyweight",
            "Weightlifting Men's Bantamweight",
            "Weightlifting Women's Featherweight"
        ]
      }
    }
  ]
}
```

### `GET /api/v1/medalists`

Returns a list of all medalists, broken down by event.

**Example of expected response:**
```
{
  "data": {
    "id": null,
    "type": "events",
    "attributes": {
      "event_medalists": [
        {
          "event": "Rowing Men's Coxless Pairs",
          "medalists": [
            {
              "name": "Giovanni Abagnale",
              "team": "Italy",
              "age": 21,
              "medal": "Bronze"
            },
            {
              "name": "Hamish Byron Bond",
              "team": "New Zealand",
              "age": 30,
              "medal": "Gold"
            },
            {
              "name": "Lawrence Brittain",
              "team": "South Africa",
              "age": 25,
              "medal": "Silver"
            }
          ]
        }
      ]
    }
  }
}
```

### `GET /api/v1/medal_count`

Returns a list of teams with their associated medal counts.

**Example of expected response:**
```
{
  "data": {
    "id": null,
    "type": "teams",
    "attributes": {
      "team_medalists": [
        {
          "team": "Romania",
          "total_medal_count": 7,
          "medals": {
              "bronze": 5,
              "silver": 0,
              "gold": 2
          }
        },
        {
          "team": "Spain",
          "total_medal_count": 14,
          "medals": {
              "bronze": 6,
              "silver": 4,
              "gold": 4
          }
        }
      ]
    }
  }
}
```

### `GET /api/v1/event_participation`

Returns a list of teams with their total event participation.

**Example of expected response:**
```
{
  "data": {
    "id": null,
    "type": "team",
    "attributes": {
      "team_participation": [
        {
          "team": "Romania",
          "event_participation": "29 of 305 events",
          "percentage": 0.1,
          "events": [
            "Weightlifting Women's Super-Heavyweight",
            "Rowing Men's Coxless Fours",
            "Wrestling Men's Heavyweight, Greco-Roman",
            "Athletics Women's 20 kilometres Walk",
            "Handball Women's Handball",
            "Tennis Women's Singles",
            "Tennis Mixed Doubles",
            "Tennis Women's Doubles",
            "Rowing Women's Lightweight Double Sculls",
            "Rowing Women's Coxless Pairs",
            "Rowing Women's Coxed Eights",
            "Athletics Women's 800 metres",
            "Athletics Women's 3,000 metres Steeplechase",
            "Fencing Women's epee, Individual",
            "Fencing Women's epee, Team",
            "Athletics Women's Triple Jump",
            "Fencing Women's Foil, Individual",
            "Judo Women's Lightweight",
            "Weightlifting Men's Middleweight",
            "Judo Women's Half-Lightweight",
            "Athletics Women's Marathon",
            "Athletics Men's 50 kilometres Walk",
            "Swimming Men's 4 x 100 metres Freestyle Relay",
            "Table Tennis Men's Singles",
            "Swimming Women's 100 metres Freestyle",
            "Fencing Men's Sabre, Individual",
            "Gymnastics Men's Floor Exercise",
            "Gymnastics Men's Horse Vault",
            "Gymnastics Men's Horizontal Bar"
          ]
        }
      ]
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

### API Exploration

Once installation and database setup are complete, explore the various API endpoints with the following steps:
* From the `koroibos` project directory, boot up a server with `$ rails s`
* Open your browser, and visit `http://localhost:3000/`
* In a separate terminal window, query the available endpoints by running `rails routes`
* Copy any of the URIs displayed and append to `http://localhost:3000/` in your browser

### Testing

The full test suite can be run with `$ bundle exec rspec`.
