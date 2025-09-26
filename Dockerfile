FROM golang:1.21.4 AS build

ARG HUGO_VERSION=0.150.1

ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb /tmp/hugo.deb
RUN apt install -y /tmp/hugo.deb

ENTRYPOINT ["hugo"]
