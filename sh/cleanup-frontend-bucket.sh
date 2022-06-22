#!/usr/bin/env bash

OLD_VERSION=$(git describe --abbrev=0 --tags `git rev-list --tags --skip=1 --max-count=1`)
OLD_VERSION_NAME="${OLD_VERSION//./"-"}"
echo OLD_VERSION: ${OLD_VERSION}

aws s3 rm "s3://cloud-devops-capstone-${OLD_VERSION_NAME}" --recursive
aws cloudformation delete-stack --stack-name "cloud-devops-capstone-${OLD_VERSION_NAME}"