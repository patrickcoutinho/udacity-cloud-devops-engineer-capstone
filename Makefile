install:
	yarn

dev:
	yarn start

dev-docker:
	docker-compose up

test:
	yarn test

lint:
	yarn lint

build-docker-images:
	./sh/build-docker-images.sh version=$(version)

push-docker-images:
	./sh/push-docker-images.sh version=$(version)

create-eks-cluster:
	aws cloudformation deploy \
		--template-file ./eks/cluster.yml \
		--stack-name CloudDevopsCapstone \
		--region us-east-1 \
		--capabilities CAPABILITY_IAM --profile

create-eks-nodegoup:
	aws cloudformation deploy \
		--template-file ./eks/nodegroup.yml \
		--stack-name CloudDevopsCapstoneNodeGroup \
		--region us-east-1 \
		--capabilities CAPABILITY_IAM --profile