.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/origination-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/origination-service:latest .

docker-run:
	docker run --rm -p 50100:50100 --env-file .env ledgerx/origination-service:latest
