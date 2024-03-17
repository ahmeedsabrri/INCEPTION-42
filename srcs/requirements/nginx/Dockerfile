FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MA/ST=khouribgha/L=khouribgha/O=1337/OU=1337/CN=localhost"

COPY ./conf/File.conf /etc/nginx/sites-enabled/default
CMD ["nginx", "-g", "daemon off;"]
