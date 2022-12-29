RUN_ARGS := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
ARCH := $(shell uname -m)

ifeq ($(ARCH),arm64)
BASE_DOCKERFILE := docker-compose.silicon_base.yml
else
BASE_DOCKERFILE := docker-compose.base.yml
endif

TRACKER_APP_COMPOSE := docker compose -f tracker_app/docker-compose.yml -f tracker_app/$(BASE_DOCKERFILE)

build:
	$(TRACKER_APP_COMPOSE) build

tracker_bash:
	$(TRACKER_APP_COMPOSE) run --rm tracker_app /bin/bash

prepare_db:
	$(TRACKER_APP_COMPOSE) run --rm tracker_app /bin/bash -c "rake db:create db:schema:load db:seed"

up:
	$(TRACKER_APP_COMPOSE) up

down:
	$(TRACKER_APP_COMPOSE) down
