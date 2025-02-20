FROM alpine:latest

# install build tools
RUN apk add --no-cache git openssh py3-pip docker yq ostree

# install west and pulp ostree plugin
RUN python3 -m venv nulix-os-venv && \
    source nulix-os-venv/bin/activate && \
    pip3 install west && \
    pip3 install pulp-cli-ostree

