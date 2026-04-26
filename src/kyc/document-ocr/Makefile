.PHONY: build test run lint tidy docker-build

build:
	go build -o bin/document-ocr .

test:
	go test ./... -v -race

run:
	go run .

tidy:
	go mod tidy

lint:
	golangci-lint run ./...

docker-build: tidy
	docker build -t ledgerx/document-ocr:latest .

docker-run:
	docker run --rm -p 50122:50122 --env-file .env ledgerx/document-ocr:latest
