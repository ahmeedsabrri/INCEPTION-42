FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    mariadb-server mariadb-client \
    && rm -rf /var/lib/apt/lists/*
EXPOSE 3306
CMD ["/bin/bash"]