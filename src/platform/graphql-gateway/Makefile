.PHONY: build test run lint tidy docker-build
build:
	go build -o bin/graphql-gateway .
test:
	go test ./... -v -race
run:
	go run .
tidy:
	go mod tidy
lint:
	golangci-lint run ./...
docker-build: tidy
	docker build -t ledgerx/graphql-gateway:latest .
