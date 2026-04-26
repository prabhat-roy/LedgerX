.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/transaction-monitoring .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/transaction-monitoring:latest .

docker-run:
	docker run --rm -p 50140:50140 --env-file .env ledgerx/transaction-monitoring:latest
