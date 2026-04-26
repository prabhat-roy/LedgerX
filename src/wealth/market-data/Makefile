.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/market-data .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/market-data:latest .

docker-run:
	docker run --rm -p 50163:50163 --env-file .env ledgerx/market-data:latest
