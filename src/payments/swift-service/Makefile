.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/swift-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/swift-service:latest .

docker-run:
	docker run --rm -p 50062:50062 --env-file .env ledgerx/swift-service:latest
