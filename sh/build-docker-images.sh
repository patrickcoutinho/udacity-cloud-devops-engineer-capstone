#!/usr/bin/env bash

repo=patrickcoutinho
basename=$repo/cloud-devops-

docker build -f ./backend/bff/Dockerfile -t ${basename}backend-bff ./backend/bff
docker build -f ./backend/profiles/Dockerfile -t ${basename}backend-profiles ./backend/profiles
docker build -f ./backend/users/Dockerfile -t ${basename}backend-users ./backend/users
docker build -f ./redis/Dockerfile -t ${basename}redis ./redis