FROM debian:stretch
MAINTAINER marcus.rickert@accso.de

ARG DOCKER_COMPOSE_VERSION=1.11.2

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -f -y  wget curl && \
    wget -nc -q https://download.docker.com/linux/debian/dists/stretch/pool/stable/amd64/docker-ce_17.03.2~ce-0~debian-stretch_amd64.deb -O /tmp/docker.deb && \
    dpkg -i /tmp/docker.deb || true && \
    DEBIAN_FRONTEND=noninteractive apt-get -f -y install && \
    curl -s -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    rm -f /tmp/docker.deb
