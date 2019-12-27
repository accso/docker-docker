FROM debian:stretch-slim
MAINTAINER marcus.rickert@accso.de

ARG DOCKER_VERSION=17.12.1
ARG DOCKER_COMPOSE_VERSION=1.11.2

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -f -y  \
                                   git \
    				   wget \
				   curl \
				   python3 \
				   python3-dev \
				   python3-pip \
				   expect && \
    wget -nc -q https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/docker-ce_${DOCKER_VERSION}~ce-0~debian_amd64.deb -O /tmp/docker.deb && \
    dpkg -i /tmp/docker.deb || true && \
    DEBIAN_FRONTEND=noninteractive apt-get -f -y install && \
    curl -s -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    rm -f /tmp/docker.deb
