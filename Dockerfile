FROM alpine:latest

# install build tools
RUN apk add --no-cache git openssh py3-pip docker yq ostree

# install west
RUN python3 -m venv nulix-os-venv && \
    source nulix-os-venv/bin/activate && \
    pip3 install west

