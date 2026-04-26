.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/orchestrator .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/orchestrator:latest .

docker-run:
	docker run --rm -p 50260:50260 --env-file .env ledgerx/orchestrator:latest
