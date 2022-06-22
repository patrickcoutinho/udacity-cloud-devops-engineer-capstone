#!/usr/bin/env bash

export NEW_VERSION=$(git describe --tags --abbrev=0)
echo NEW_VERSION: $NEW_VERSION

aws cloudformation deploy \
    --template-file ./cloudformation/frontend/s3.yml \
    --stack-name "cloud-devops-capstone-${NEW_VERSION}" \
    --tags project=cloud-devops-capstone \
    --parameter-overrides version="${NEW_VERSION}"