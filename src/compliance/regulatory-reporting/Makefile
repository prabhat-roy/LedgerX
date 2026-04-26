.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/regulatory-reporting .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/regulatory-reporting:latest .

docker-run:
	docker run --rm -p 50223:50223 --env-file .env ledgerx/regulatory-reporting:latest
