.PHONY: build test run lint tidy docker-build
build:
	go build -o bin/tenant-service .
test:
	go test ./... -v -race
run:
	go run .
tidy:
	go mod tidy
lint:
	golangci-lint run ./...
docker-build: tidy
	docker build -t ledgerx/tenant-service:latest .
