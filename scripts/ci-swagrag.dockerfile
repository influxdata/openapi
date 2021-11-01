FROM alpine

RUN apk add --no-cache git

COPY --from=docker.io/glinton/swagrag:0.1.0 /swagrag /bin/swagrag
