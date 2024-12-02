FROM ghcr.io/runatlantis/atlantis:v0.31.0
USER root
RUN apk add aws-cli
USER atlantis