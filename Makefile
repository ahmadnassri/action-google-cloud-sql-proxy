#!/usr/bin/make

# ------------------------------------------------------- #
# Note: this file originates in template-action-composite #
# ------------------------------------------------------- #

# Docker

pull: ## pull latest containers
	@docker compose pull

lint: ## run super-linter
	@docker compose run --rm lint

readme: ## run readme action
	@docker compose run --rm readme

clean: ## remove running containers, volumes, node_modules & anything else
	@docker compose rm --stop --volumes --force

# Utility methods
## Help: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

help: ## display this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help
.PHONY: help all clean test
