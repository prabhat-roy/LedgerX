.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/api-gateway-ob .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/api-gateway-ob:latest .

docker-run:
	docker run --rm -p 50241:50241 --env-file .env ledgerx/api-gateway-ob:latest
