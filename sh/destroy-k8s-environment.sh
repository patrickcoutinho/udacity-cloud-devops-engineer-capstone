#!/usr/bin/env bash

aws eks update-kubeconfig --name cloud-devops-capstone

NEW_VERSION=$(git describe --abbrev=0 --tags)
NEW_VERSION_NAME="${NEW_VERSION//./"-"}"
echo NEW_VERSION_NAME: ${NEW_VERSION_NAME}

kubectl delete service cloud-devops-backend-bff-lb-green \
    cloud-devops-backend-profiles-svc-green \
    cloud-devops-backend-users-svc-green

kubectl delete deployment cloud-devops-backend-bff-${NEW_VERSION_NAME} \
    cloud-devops-backend-profiles-${NEW_VERSION_NAME} \
    cloud-devops-backend-users-${NEW_VERSION_NAME}