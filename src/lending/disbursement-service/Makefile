.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/disbursement-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/disbursement-service:latest .

docker-run:
	docker run --rm -p 50103:50103 --env-file .env ledgerx/disbursement-service:latest
