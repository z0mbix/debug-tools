.DEFAULT_GOAL := help
IMAGE_NAME := z0mbix/debug-tools
IMAGE_TAG := latest
PLATFORM := linux/amd64

build: ## Build docker image
	docker build --platform $(PLATFORM) -t $(IMAGE_NAME):$(IMAGE_TAG) .

run: ## Run docker container
	docker run --platform $(PLATFORM) -it --rm --name debugger $(IMAGE_NAME):$(IMAGE_TAG)

scan: ## Run docker scan to scan the image
	docker scan $(IMAGE_NAME):$(IMAGE_TAG)

publish: ## Publish docker image to dockerhub
	docker push $(IMAGE_NAME):$(IMAGE_TAG)

help: ## See all the Makefile targets
	@grep -E '^[a-zA-Z0-9._-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build run scan publish help
