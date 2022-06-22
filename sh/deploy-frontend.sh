#!/usr/bin/env bash

aws eks update-kubeconfig --name cloud-devops-capstone

NEXT_PUBLIC_API=$(kubectl describe service/cloud-devops-backend-bff-lb-blue | grep Ingress | awk '{print $3}')

echo "NEXT_PUBLIC_API=http://${NEXT_PUBLIC_API}:3000" > ./frontend/.env

echo NEXT_PUBLIC_API: $NEXT_PUBLIC_API

echo frontend/.env:
cat ./frontend/.env

NEW_VERSION=$(git describe --tags --abbrev=0)
NEW_VERSION_NAME="${NEW_VERSION//./"-"}"
echo NEW_VERSION: $NEW_VERSION

yarn frontend:export

aws s3 cp ./frontend/out s3://cloud-devops-capstone-${NEW_VERSION_NAME} --recursive