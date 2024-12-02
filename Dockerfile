ARG ATLANTIS_VERSION=v0.31.0

FROM ghcr.io/runatlantis/atlantis:${ATLANTIS_VERSION}
USER root
RUN apk add aws-cli
USER atlantis