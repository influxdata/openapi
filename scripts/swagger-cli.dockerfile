FROM node:16-alpine

RUN npm set progress=false && npm config set depth 0
RUN npm install --only=production -g swagger-cli

WORKDIR /openapi
RUN mkdir -p /openapi
