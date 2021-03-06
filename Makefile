
BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
COMMIT := $(shell git rev-parse HEAD)
REPOSITORY=krol
PROJECT=go_api
PORT=8080

build:
	CGO_ENABLED=0 GOOS=linux go build -o ./bin/go-api-simple ./pkg/main.go

build-container:
	echo "Image: ${REPOSITORY}/${PROJECT}:$(BRANCH)"
	docker build -t ${REPOSITORY}/${PROJECT}:$(BRANCH) .

run-container:
	docker run -it -p ${PORT}:${PORT} ${REPOSITORY}/${PROJECT}:$(BRANCH)

test:
	GO111MODULE=on go test -v -short -race -timeout 30s -coverprofile=coverage.txt -covermode=atomic ./...