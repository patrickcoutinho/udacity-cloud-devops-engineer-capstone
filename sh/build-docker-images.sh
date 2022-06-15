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

docker build -f ./backend/bff/Dockerfile -t ${basename}backend-bff:${version} ./backend/bff
docker build -f ./backend/profiles/Dockerfile -t ${basename}backend-profiles:${version} ./backend/profiles
docker build -f ./backend/users/Dockerfile -t ${basename}backend-users:${version} ./backend/users
docker build -f ./redis/Dockerfile -t ${basename}redis:${version} ./redis