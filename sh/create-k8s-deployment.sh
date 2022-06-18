#!/usr/bin/env bash

NEW_VERSION=$(git describe --tags --abbrev=0)
NEW_VERSION_NAME="${NEW_VERSION//./"-"}"
echo NEW_VERSION: $NEW_VERSION

aws eks update-kubeconfig --name cloud-devops-capstone

SVC_ENV=green
echo SVC_ENV: $SVC_ENV

template=`cat "k8s/backend-users-service.yaml" | sed "s/{{SVC_ENV}}/$SVC_ENV/g" | sed "s/{{NEW_VERSION_NAME}}/$NEW_VERSION_NAME/g"`
echo "$template" | kubectl apply -f -

template=`cat "k8s/backend-users-deployment.yaml" | sed "s/{{NEW_VERSION}}/$NEW_VERSION/g" | sed "s/{{NEW_VERSION_NAME}}/$NEW_VERSION_NAME/g"`
echo "$template" | kubectl apply -f -

template=`cat "k8s/backend-profiles-service.yaml" | sed "s/{{SVC_ENV}}/$SVC_ENV/g" | sed "s/{{NEW_VERSION_NAME}}/$NEW_VERSION_NAME/g"`
echo "$template" | kubectl apply -f -

template=`cat "k8s/backend-profiles-deployment.yaml" | sed "s/{{NEW_VERSION}}/$NEW_VERSION/g" | sed "s/{{NEW_VERSION_NAME}}/$NEW_VERSION_NAME/g"`
echo "$template" | kubectl apply -f -

template=`cat "k8s/backend-bff-service.yaml" | sed "s/{{SVC_ENV}}/$SVC_ENV/g" | sed "s/{{NEW_VERSION_NAME}}/$NEW_VERSION_NAME/g"`
echo "$template" | kubectl apply -f -

template=`cat "k8s/backend-bff-deployment.yaml" | sed "s/{{NEW_VERSION}}/$NEW_VERSION/g" | sed "s/{{NEW_VERSION_NAME}}/$NEW_VERSION_NAME/g"`
echo "$template" | kubectl apply -f -