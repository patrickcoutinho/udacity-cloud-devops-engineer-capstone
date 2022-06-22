FROM node:16-alpine

RUN apk add --no-cache bash curl git make tar gzip openssh \
    && apk add --no-cache yarn --repository="http://dl-cdn.alpinelinux.org/alpine/edge/community"

RUN yarn global add @nestjs/cli

RUN apk add --no-cache python3 py3-pip

RUN pip3 install --upgrade pip && pip3 install --no-cache-dir awscli

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl

RUN chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl

RUN apk add --no-cache docker openrc
RUN rc-update add docker boot

RUN rm -rf /var/cache/apk/*