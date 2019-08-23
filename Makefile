VERSION := 1.9.2
.PHONY: all build push

all: build push

build:
	DOKCER_BUILDKIT=1 docker build --build-arg VERSION=$(VERSION) . -t mimuret/unbound:$(VERSION) -t mimuret/unbound:latest

push:
	docker push mimuret/unbound:$(VERSION)
	docker push mimuret/unbound:latest
