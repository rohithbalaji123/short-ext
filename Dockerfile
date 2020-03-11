FROM node:12.7.0-alpine

WORKDIR /usr/src/app

COPY . .

RUN apk add --no-cache bash zip
RUN yarn
RUN yarn build:production
RUN zip -r build/short-ext.zip build/* -x "*.DS_Store"
RUN cat ./build/manifest.json
RUN ls ./build/
