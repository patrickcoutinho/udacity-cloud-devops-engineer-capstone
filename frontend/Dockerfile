FROM node:16-alpine

WORKDIR /app

RUN apk add --no-cache bash
RUN apk add --no-cache yarn --repository="http://dl-cdn.alpinelinux.org/alpine/edge/community"

COPY . .

RUN yarn

EXPOSE 3001

CMD yarn dev
