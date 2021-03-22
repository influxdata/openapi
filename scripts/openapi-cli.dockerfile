FROM alpine AS base

RUN apk add --no-cache nodejs-current npm
RUN npm set progress=false && npm config set depth 0
RUN npm install --only=production -g swagger-cli

WORKDIR /src
RUN mkdir -p /src
 
ENTRYPOINT ["swagger-cli"]
