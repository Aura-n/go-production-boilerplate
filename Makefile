.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

MAKEFILE_DIR := $(PWD)

include .env
export

deploy: ## Deploy applications from local.
	sh -x deploy.sh

docker-compose-build: ## Build containers by docker-compose.
ifeq ($(env), prod)
	docker-compose --verbose -f docker-compose.prod.yml build --no-cache
else
	docker-compose -f docker-compose.yml build
endif

docker-compose-up: ## Run containers by docker-compose.
ifeq ($(env), prod)
	docker-compose --verbose -f docker-compose.prod.yml up --no-deps
else
	docker-compose -f docker-compose.yml up
endif

docker-compose-up-d: ## Run containers in the background by docker-compose.
ifeq ($(env), prod)
	docker-compose --verbose -f docker-compose.prod.yml up -d --no-deps
else
	docker-compose -f docker-compose.yml up -d
endif

lint: ## Run golint.
	docker exec -it go-production-boilerplate golint ./...

test: ## Run tests.
	docker exec -it go-production-boilerplate go test -v ./...

build: ## Run go build
	cd app && GOOS=linux GOARCH=amd64 go build -o go-production-boilerplate
