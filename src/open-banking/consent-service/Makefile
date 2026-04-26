.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/consent-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/consent-service:latest .

docker-run:
	docker run --rm -p 50240:50240 --env-file .env ledgerx/consent-service:latest
