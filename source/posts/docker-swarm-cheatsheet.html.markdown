---

title: Docker Swarm Cheatsheet
description: Useful commands for Docker Swarm
date: 2022-11-28 9:31 UTC
tags: development, cheatsheet, docker swarm, gist
gh: https://gist.github.com/jferrer/c0d9c375487ec3d573e56b91c39767ad
---

~~~bash
# Init Swarm
$ docker swarm init --advertise-addr <IP address of instance>

# List machines
$ docker-machine ls

# Target Local Docker
$ eval $(docker-machine env -u)

# Target Remote Docker
$ eval $(docker-machine env remote-docker)

# Ssh to Docker instance
$ docker-machine ssh local-vm-1

# Build App
$ docker build -f production.Dockerfile -t myapp .

# Push image to Docker hub
$ docker push myapp

# Deploy stack
$ docker stack deploy -c docker-stack.yml --with-registry-auth myapp

# Update service
$ docker service update --image myapp_image myapp_stack

# List services
$ docker stack services myapp
$ docker service ls

# Logs
$ docker service logs -f myapp
~~~


