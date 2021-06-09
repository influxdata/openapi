FROM alpine

RUN apk add --no-cache git

COPY --from=docker.io/glinton/swagrag /swagrag /bin/swagrag
