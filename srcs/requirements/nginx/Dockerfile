FROM debian:oldstable

RUN apt-get update && apt-get install -y \
    build-essential \
    mariadb-server mariadb-client \
    cmake \
    git \
    libboost-all-dev \
    libssl-dev \
    libtool \
    pkg-config \
    python3 \
    python3-pip \
    wget \
    && rm -rf /var/lib/apt/lists/*
CMD ["/bin/bash"]
