.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/underwriting-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/underwriting-service:latest .

docker-run:
	docker run --rm -p 50182:50182 --env-file .env ledgerx/underwriting-service:latest
