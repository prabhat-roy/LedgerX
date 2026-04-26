.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/sms-alert .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/sms-alert:latest .

docker-run:
	docker run --rm -p 50261:50261 --env-file .env ledgerx/sms-alert:latest
