#!/usr/bin/env bash

repo=patrickcoutinho
basename=$repo/cloud-devops-

docker push ${basename}backend-bff
docker push ${basename}backend-profiles
docker push ${basename}backend-users
docker push ${basename}redis