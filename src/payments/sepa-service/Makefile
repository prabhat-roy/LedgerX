.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/sepa-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/sepa-service:latest .

docker-run:
	docker run --rm -p 50063:50063 --env-file .env ledgerx/sepa-service:latest
