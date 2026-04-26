.PHONY: build test run lint tidy docker-build docker-run

build:
	go build -o bin/api-gateway .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/api-gateway:latest .

docker-run:
	docker run --rm -p 60000:60000 --env-file .env ledgerx/api-gateway:latest
