.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/policy-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/policy-service:latest .

docker-run:
	docker run --rm -p 50180:50180 --env-file .env ledgerx/policy-service:latest
