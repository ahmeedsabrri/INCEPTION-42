FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx openssl
RUN mkdir -p /etc/nginx/certif
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/certif/nginx-selfsigned.key -out /etc/nginx/certif/nginx-selfsigned.crt -subj "/C=MA/ST=khouribgha/L=khouribgha/O=1337/OU=1337/CN=localhost"
COPY ./depends/default.conf /etc/nginx/sites-available/default
CMD ["nginx", "-g", "daemon off;"]