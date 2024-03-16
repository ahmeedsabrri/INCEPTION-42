FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
EXPOSE 80 80
CMD ["nginx", "-g", "daemon off;"]
