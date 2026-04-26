.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/gateway-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/gateway-service:latest .

docker-run:
	docker run --rm -p 50060:50060 --env-file .env ledgerx/gateway-service:latest
