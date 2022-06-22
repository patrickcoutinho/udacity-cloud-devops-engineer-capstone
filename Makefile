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
		--region us-east-1 \
		--capabilities CAPABILITY_IAM \
		--profile=udacity

create-eks-nodegroup:
	aws cloudformation deploy \
		--template-file ./cloudformation/eks/nodegroup.yml \
		--stack-name CloudDevopsCapstoneNodeGroup-$(nodeName) \
		--region us-east-1 \
		--capabilities CAPABILITY_IAM \
		--parameter-overrides file://./cloudformation/eks/nodegroup-$(nodeName)-params.json \
		--profile=udacity

create-eks-all: create-eks-cluster
	$(MAKE) create-eks-nodegroup nodeName=redis
	$(MAKE) create-eks-nodegroup nodeName=users
	$(MAKE) create-eks-nodegroup nodeName=profiles
	$(MAKE) create-eks-nodegroup nodeName=bff

delete-eks-all:
	aws cloudformation delete-stack --stack-name CloudDevopsCapstoneNodeGroup-redis --region=us-east-1 --profile=udacity
	aws cloudformation delete-stack --stack-name CloudDevopsCapstoneNodeGroup-users --region=us-east-1 --profile=udacity
	aws cloudformation delete-stack --stack-name CloudDevopsCapstoneNodeGroup-profiles --region=us-east-1 --profile=udacity
	aws cloudformation delete-stack --stack-name CloudDevopsCapstoneNodeGroup-bff --region=us-east-1 --profile=udacity
	aws cloudformation delete-stack --stack-name CloudDevopsCapstone --region=us-east-1 --profile=udacity

create-frontend-cloudfront:
	aws cloudformation deploy \
		--template-file ./cloudformation/frontend/cloudfront.yml \
		--stack-name CloudDevopsCapstoneFront \
		--parameter-overrides version="prod" \
		--region us-east-1 \
		--profile=udacity

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
