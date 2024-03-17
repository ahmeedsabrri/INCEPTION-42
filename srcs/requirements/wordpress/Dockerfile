
FROM debian:bullseye

RUN apt-get update && apt-get install -y php7.4-fpm php-mysql  wget

COPY ./tools/wpScript.sh .

CMD ["bash", "wpScript.sh"]