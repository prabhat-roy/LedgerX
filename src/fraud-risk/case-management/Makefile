.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/case-management .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/case-management:latest .

docker-run:
	docker run --rm -p 50142:50142 --env-file .env ledgerx/case-management:latest
