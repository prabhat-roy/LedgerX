.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/issuance-service .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/issuance-service:latest .

docker-run:
	docker run --rm -p 50080:50080 --env-file .env ledgerx/issuance-service:latest
