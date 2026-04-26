.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/device-trust .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/device-trust:latest .

docker-run:
	docker run --rm -p 50023:50023 --env-file .env ledgerx/device-trust:latest
