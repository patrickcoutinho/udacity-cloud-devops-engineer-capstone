#!/usr/bin/env bash

aws eks update-kubeconfig --name cloud-devops-capstone

OLD_VERSION=$(cat old_version.txt)
OLD_VERSION_NAME="${OLD_VERSION//./"-"}"
echo OLD_VERSION_NAME: ${OLD_VERSION_NAME}

kubectl delete service cloud-devops-backend-bff-lb-green \
    cloud-devops-backend-profiles-svc-green \
    cloud-devops-backend-users-svc-green

kubectl delete deployment cloud-devops-backend-bff-${OLD_VERSION_NAME} \
    cloud-devops-backend-profiles-${OLD_VERSION_NAME} \
    cloud-devops-backend-users-${OLD_VERSION_NAME}