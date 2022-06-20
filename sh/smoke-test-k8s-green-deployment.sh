#!/usr/bin/env bash

for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done

NEW_VERSION=$(git describe --tags --abbrev=0)
NEW_VERSION_NAME="${NEW_VERSION//./"-"}"

aws eks update-kubeconfig --name cloud-devops-capstone

kubectl wait deployment -n default cloud-devops-backend-bff-${NEW_VERSION_NAME} --for condition=Available=True --timeout=180s

sleep 30

GREEN_URL=$(kubectl describe service/cloud-devops-backend-bff-lb-${svc_env} | grep Ingress | awk '{print $3}')
echo GREEN_URL: "${GREEN_URL}:3000/accounts"

curl -s "${GREEN_URL}:3000/accounts"

if curl -s "${GREEN_URL}:3000/accounts" | grep "login"
then
    return 0
else
    return 1
fi
