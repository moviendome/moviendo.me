---

title: Create a Rails API + Postgres with Docker from scratch without having to even install Ruby locally
date: 2021-05-05 00:01 UTC
tags: development, api, rails, postgres, docker, docker-compose
cover: create-a-rails-api-postgres-with-docker-from-scratch-without-having-to-even-install-ruby-locally/ruby-on-rails-docker-564aca1b.jpg

---

<div class="content-image" markdown="1">
  ![](create-a-rails-api-postgres-with-docker-from-scratch-without-having-to-even-install-ruby-locally/ruby-on-rails-docker.jpg)
</div>

Every time that I have to start a new project (Ruby, Rails, JS...) I always start [Docker](https://www.docker.com/) first! This means, I never install a single Gem or Package on my local machine.

It helps me to avoid conflicts with different versions of the same package, lost dependencies in the system and so on.

Everything that I use for development on my laptop runs in a [Docker](https://www.docker.com/) container, even [Neovim](https://github.com/jferrer/neovim-dockerized).

This is an example of how to create, step by step, a [Ruby on Rails](http://rubyonrails.org/) API + [Postgres](https://www.postgresql.org/) and the only thing you need to follow is [Docker](https://www.docker.com/).

So let's start:


## Create the directory for the API

~~~bash
$ mkdir docker-compose-rails-api
$ cd docker-compose-rails-api
~~~

## Create the Dockerfile

~~~bash
FROM ruby:2.7.3
LABEL Description="Docker Rails API Base"
WORKDIR /app

RUN gem install bundler

CMD exec bin/start.sh
~~~

## Create the Gemfile

~~~bash
source "https://rubygems.org"

ruby "2.7.3"
gem "rails", "~> 6.1.3.2"
~~~

## Create the docker-compose.yml

~~~bash
version: "3"
services:
  api:
    restart: on-failure
    build: .
    tty: true
    stdin_open: true
    volumes:
      - .:/app
      - bundle_cache:/usr/local/bundle
    ports:
      - "3000:3000"
    depends_on:
      - db
    environment:
      DATABASE_URL: postgresql://postgres@db/api_development
      TEST_DATABASE_URL: postgresql://postgres@db/api_test
  db:
    image: postgres:latest
    volumes:
      - ./docker/data-volume/postgresql:/var/lib/postgresql/data
    ports:
      - 5456:5432
    environment:
      POSTGRES_HOST_AUTH_METHOD: trust
volumes:
  bundle_cache:
~~~

## Create a bin/start.sh file

~~~bash
bundle check || bundle install

if [ -f tmp/pids/server.pid ]; then
  rm -f tmp/pids/server.pid
fi

bin/rails s -p 3000 -b 0.0.0.0
~~~

### And set permissions

~~~bash
$ chmod +x bin/start.sh
~~~

## Install Rails

~~~bash
$ docker-compose run api gem install rails -v 6.1.3.2
~~~

## Create the Rails API

~~~bash
$ docker-compose run api rails new . --api --force --database=postgresql --skip-bundle
~~~

## Replace content of config/database.yml with this:

~~~bash
global: &default
    adapter: postgresql
    pool: 5
    url: <%= ENV["DATABASE_URL"] %>

  development:
    <<: *default

  test:
    <<: *default
    url: <%= ENV["TEST_DATABASE_URL"] %>

  production:
    <<: *default
~~~

## Start the server

~~~bash
$ docker-compose up -d
~~~

## Create the database

~~~bash
$ docker-compose run api bin/rails db:create
~~~

## Voilà!

Go to your browser and check [http://0.0.0.0:3000](http://0.0.0.0:3000) to see it working!
