install:
	yarn

dev:
	yarn start

dev-docker:
	docker-compose up

test:
	yarn test

lint:
	@echo to-do

build-docker-images:
	./sh/build-docker-images.sh

push-docker-images:
	@echo to-do