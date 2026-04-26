.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/psd2-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/psd2-service:latest .

docker-run:
	docker run --rm -p 50243:50243 --env-file .env ledgerx/psd2-service:latest
