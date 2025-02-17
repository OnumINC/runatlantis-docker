ARG ATLANTIS_VERSION=v0.31.0

FROM ghcr.io/runatlantis/atlantis:${ATLANTIS_VERSION} AS builder
USER root
ENV PIPX_HOME=/opt/pipx
ENV PIPX_BIN_DIR=/usr/local/bin
RUN apk add aws-cli cdrkit libxslt pipx gcc musl-dev python3-dev libffi-dev openssl-dev cargo make
RUN pipx install azure-cli

FROM ghcr.io/runatlantis/atlantis:${ATLANTIS_VERSION} AS final
USER root
RUN apk add aws-cli cdrkit libxslt py3-pip

COPY --from=builder /opt/pipx /opt/pipx
COPY --from=builder /usr/local/bin /usr/local/bin

USER atlantis
