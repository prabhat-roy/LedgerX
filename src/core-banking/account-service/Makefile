.PHONY: build test run docker-build
build:
	mvn -B package -DskipTests
test:
	mvn -B test
run:
	mvn -B spring-boot:run
docker-build:
	docker build -t ledgerx/account-service:latest .
