FROM node:16-alpine

RUN npm set progress=false && npm config set depth 0
RUN npm install --only=production -g swagger-cli
RUN apk --no-cache add curl
RUN curl -L https://github.com/cue-lang/cue/releases/download/v0.4.0/cue_v0.4.0_linux_amd64.tar.gz | tar -x -zC /usr/bin cue
RUN echo '160e7b670f3c8f13c4931a42e5610d5a540ba693e33d5d24da3f236124484ebb  /usr/bin/cue' | sha256sum -c

WORKDIR /openapi
RUN mkdir -p /openapi
