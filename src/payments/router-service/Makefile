.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/router-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/router-service:latest .

docker-run:
	docker run --rm -p 50061:50061 --env-file .env ledgerx/router-service:latest
