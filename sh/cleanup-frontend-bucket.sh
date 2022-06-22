#!/usr/bin/env bash

OLD_VERSION=$(git describe --abbrev=0 --tags `git rev-list --tags --skip=1 --max-count=1`)
echo OLD_VERSION: ${OLD_VERSION}

aws s3 rm "s3://cloud-devops-capstone-${OLD_VERSION}" --recursive