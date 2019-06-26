.DEFAULT_GOAL := help

build: ## Build docker image
	docker build -t z0mbix/debug-tools:latest .

run: ## Run docker container
	docker run -it --name debugger z0mbix/debug-tools:latest

publish: ## Publish docker image to dockerhub
	docker push z0mbix/debug-tools:latest

help: ## See all the Makefile targets
	@grep -E '^[a-zA-Z0-9._-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build run help
