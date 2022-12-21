#!/usr/bin/env just --justfile
# just manual: https://github.com/casey/just/#readme

_default:
    @just --list

# Install Loki Docker Driver plugin
loki-docker-driver-install:
    docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
    sudo cp ./monitoring/loki/daemon.json /etc/docker/daemon.json
    sudo systemctl restart docker

# Restart docker
docker-restart:
    sudo systemctl restart docker

# Build docker.
docker-build:
    docker build -t app-example:distroless -f Dockerfile .

# Docker compose up.
docker-compose-up:
    docker-compose up

# Docker compose down.
docker-compose-down:
    docker-compose down
