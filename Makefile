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
	# hadolint ./frontend/Dockerfile
	# hadolint ./redis/Dockerfile
	# hadolint ./backend/users/Dockerfile
	# hadolint ./backend/profiles/Dockerfile
	# hadolint ./backend/bff/Dockerfile

update-version:
	npx semantic-release

build-docker-images:
	./sh/build-docker-images.sh version=$(version)

push-docker-images:
	./sh/push-docker-images.sh version=$(version)

create-eks-cluster:
	aws cloudformation deploy \
		--template-file ./cloudformation/eks/cluster.yml \
		--stack-name CloudDevopsCapstone \
		--capabilities CAPABILITY_IAM

create-eks-nodegroup:
	aws cloudformation deploy \
		--template-file ./cloudformation/eks/nodegroup.yml \
		--stack-name CloudDevopsCapstoneNodeGroup-$(nodeName) \
		--capabilities CAPABILITY_IAM \
		--parameter-overrides file://./cloudformation/eks/nodegroup-$(nodeName)-params.json

create-eks-all: create-eks-cluster
	$(MAKE) create-eks-nodegroup nodeName=redis
	$(MAKE) create-eks-nodegroup nodeName=users
	$(MAKE) create-eks-nodegroup nodeName=profiles
	$(MAKE) create-eks-nodegroup nodeName=bff
	kubectl apply -f k8s/redis-service.yaml
	kubectl apply -f k8s/redis-deployment.yaml

delete-eks-all:
	aws cloudformation delete-stack --stack-name CloudDevopsCapstoneNodeGroup-redis
	aws cloudformation delete-stack --stack-name CloudDevopsCapstoneNodeGroup-users
	aws cloudformation delete-stack --stack-name CloudDevopsCapstoneNodeGroup-profiles
	aws cloudformation delete-stack --stack-name CloudDevopsCapstoneNodeGroup-bff
	aws cloudformation delete-stack --stack-name CloudDevopsCapstone

create-frontend-s3:
	aws cloudformation deploy \
		--template-file ./cloudformation/frontend/s3.yml \
		--stack-name CloudDevopsCapstoneFrontStarterBucket \
		--parameter-overrides version="starter"

create-frontend-cloudfront:
	aws cloudformation deploy \
		--template-file ./cloudformation/frontend/cloudfront.yml \
		--stack-name CloudDevopsCapstoneFront \
		--parameter-overrides version="starter"

create-frontend-all: create-frontend-s3 create-frontend-cloudfront

create-k8s-deployment:
	./sh/create-k8s-deployment.sh svc_env=$(svc_env)

update-k8s-service:
	./sh/update-k8s-service.sh svc_env=$(svc_env)

smoke-test-k8s-green-deployment:
	sh -c '. ./sh/smoke-test-k8s-green-deployment.sh svc_env=$(svc_env)'

cleanup-k8s-deployment:
	./sh/cleanup-k8s-deployment.sh

destroy-k8s-environment:
	./sh/destroy-k8s-environment.sh

create-frontend-bucket:
	./sh/create-frontend-bucket.sh

deploy-frontend:
	./sh/deploy-frontend.sh

update-cloudfront:
	./sh/update-cloudfront.sh

cleanup-frontend-bucket:
	./sh/cleanup-frontend-bucket.sh
