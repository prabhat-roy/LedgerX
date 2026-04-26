.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/investment-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/investment-service:latest .

docker-run:
	docker run --rm -p 50161:50161 --env-file .env ledgerx/investment-service:latest
