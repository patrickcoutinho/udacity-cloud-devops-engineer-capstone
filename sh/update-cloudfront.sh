#!/usr/bin/env bash

export NEW_VERSION=$(git describe --tags --abbrev=0)
echo NEW_VERSION: $NEW_VERSION

aws cloudformation deploy \
    --template-file ./cloudformation/frontend/cloudfront.yml \
    --stack-name CloudDevopsCapstoneFront \
    --parameter-overrides version="${NEW_VERSION}" \
    --tags project=cloud-devops-capstone