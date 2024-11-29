OUTER_PORT ?= 31337
INNER_PORT ?= 31337
NAME ?= ctf-piece_of_pie
IMAGE_NAME = $(NAME)
CONTAINER_NAME = $(NAME)

build:
	docker build -f Dockerfile -t $(IMAGE_NAME) ..

run: build
	docker run -d -p $(OUTER_PORT):$(INNER_PORT) --name $(CONTAINER_NAME) -t $(IMAGE_NAME)

stop:
	-docker stop $(CONTAINER_NAME)

clean: stop
	docker rm $(CONTAINER_NAME)

.PHONY: build run stop clean
