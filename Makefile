.PHONY: build test
build:
	docker build -t docker-hugo:local .

test: build
	docker run --rm docker-hugo:local version
