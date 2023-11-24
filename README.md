# hugo-docker

A Docker/OCI image to include hugo (extended) and Golang (for hugo-modules).

## How to use

```sh
$ docker run --rm ghcr.io/hostwithquantum/hugo-docker:TAG version
hugo v0.120.4-f11bca5fec2ebb3a02727fb2a5cfb08da96fd9df+extended linux/amd64 BuildDate=2023-11-08T11:18:07Z VendorInfo=gohugoio
```

## Build base for your website

Incorporate into your own image:

```Dockerfile
FROM ghcr.io/hostwithquantum/hugo-docker:TAG as hugo

WORKDIR /website
ADD all-the-hugo-files .

RUN hugo --source . --destination public --minify

FROM nginxinc/nginx-unprivileged:1.25.3 as prod
COPY --from=hugo /website/public /usr/share/nginx/html
```

Build:

```sh
$ docker build -t mywebsite .
...
```

Deploy/run:

```sh
$ docker run --rm -p 80:8080 mywebsite:latest
...
```

Test: `open http://localhost/`
