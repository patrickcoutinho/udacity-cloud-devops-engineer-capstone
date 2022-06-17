#!/usr/bin/env bash

export NEW_VERSION=$(git describe --tags --abbrev=0)
echo NEW_VERSION: $NEW_VERSION

aws eks update-kubeconfig --name cloud-devops-capstone

kubectl apply -f k8s/backend-users-service.yaml

template=`cat "k8s/backend-users-deployment.yaml" | sed "s/{{NEW_VERSION}}/$NEW_VERSION/g"`
echo "$template" | kubectl apply -f -

kubectl apply -f k8s/backend-profiles-service.yaml

template=`cat "k8s/backend-profiles-deployment.yaml" | sed "s/{{NEW_VERSION}}/$NEW_VERSION/g"`
echo "$template" | kubectl apply -f -

kubectl apply -f k8s/backend-bff-service.yaml

template=`cat "k8s/backend-bff-deployment.yaml" | sed "s/{{NEW_VERSION}}/$NEW_VERSION/g"`
echo "$template" | kubectl apply -f -