FROM node:16-alpine

WORKDIR /app

ARG mode
ENV envMode=$mode

RUN apk add --no-cache bash
RUN apk add --no-cache yarn --repository="http://dl-cdn.alpinelinux.org/alpine/edge/community"

RUN yarn global add @nestjs/cli

COPY . .

RUN yarn

CMD yarn start:$envMode
