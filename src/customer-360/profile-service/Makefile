.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/profile-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/profile-service:latest .

docker-run:
	docker run --rm -p 50280:50280 --env-file .env ledgerx/profile-service:latest
