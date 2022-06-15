#!/usr/bin/env bash

for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done

repo=patrickcoutinho
basename=${repo}/cloud-devops-

docker push ${basename}backend-bff:${version}
docker push ${basename}backend-profiles:${version}
docker push ${basename}backend-users:${version}
docker push ${basename}redis:${version}