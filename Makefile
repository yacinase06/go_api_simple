USERNAME=krol3
BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
COMMIT := $(shell git rev-parse HEAD)
REPOSITORY=krol
PROJECT=go_api

create-rep:
	mkdir -p ${GOPATH}/src/github.com/${USERNAME}

build-go:
	go build
	./go_api

build:
	echo "Image: ${REPOSITORY}/${PROJECT}:$(BRANCH)"
	docker build -t ${REPOSITORY}/${PROJECT}:$(BRANCH) .

run:
	docker run -it ${REPOSITORY}/${PROJECT}:$(BRANCH)