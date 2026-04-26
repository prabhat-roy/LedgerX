.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/identity-verification .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/identity-verification:latest .

docker-run:
	docker run --rm -p 50120:50120 --env-file .env ledgerx/identity-verification:latest
