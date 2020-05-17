#!/bin/bash

set -eu

export DEPLOY_DOCKER_MACHINE="go-production-boilerplate"

# Change docker context to production environment
eval $(docker-machine env $DEPLOY_DOCKER_MACHINE)

# Build, and then Deploy
make src-build
docker-compose -f docker-compose.prod.yml build --no-cache
docker-compose -f docker-compose.prod.yml up --force-recreate -d --no-deps --remove-orphans

# Reset docker context
eval $(docker-machine env -u)
