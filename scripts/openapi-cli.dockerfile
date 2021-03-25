FROM alpine AS base

RUN apk add --no-cache nodejs-current npm
RUN npm set progress=false && npm config set depth 0
RUN npm install --only=production -g swagger-cli

WORKDIR /openapi
RUN mkdir -p /openapi
