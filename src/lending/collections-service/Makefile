.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/collections-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/collections-service:latest .

docker-run:
	docker run --rm -p 50104:50104 --env-file .env ledgerx/collections-service:latest
