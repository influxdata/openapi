FROM node:15.12-alpine

WORKDIR /src
RUN mkdir -p /src

RUN yarn add prettier
RUN yarn add @influxdata/oats

ENTRYPOINT ["/bin/sh", "-c"]
