FROM ubuntu:latest

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        apt-transport-https \
        build-essential \
        ca-certificates \
        git-core \
        mysql-client \
        libmysqlclient-dev \
        libmysqld-dev \
        cmake \
        libglib2.0-dev\
        zlib1g-dev \
        libpcre3-dev \
        libssl-dev \
        libyaml-dev \
        curl \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]