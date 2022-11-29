---

title: Makefile for Docker & Ruby on Rails Applications
description: Simplify development with Makefile to run Docker / Docker Compose commands
date: 2022-11-27 13:31 UTC
tags: development, docker, ruby, rails, gist
gh: https://gist.github.com/jferrer/33ed5b7ff108e383d9380839743a8f45
---

~~~bash
build:
  docker compose build

setup:
  docker compose run --rm app bin/rails db:setup

up:
  docker compose up

stop:
  docker compose stop

restart_db:
  docker compose run --rm app bin/rails db:drop
  docker compose run --rm app bin/rails db:create
  docker compose run --rm app bin/rails db:migrate
  docker compose run --rm app bin/rails db:seed

migrate:
  docker compose exec app bin/rails db:migrate

rollback:
  docker compose exec app bin/rails db:rollback

seed:
  docker compose exec app bin/rails db:seed

c:
  docker compose exec app bin/rails c

t:
  docker compose exec app bin/rails t

routes:
  docker compose exec app bin/rails routes

~~~

~~~bash
$ make build
$ make setup
$ make up
~~~
