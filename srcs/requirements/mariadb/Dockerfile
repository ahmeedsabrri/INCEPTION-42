#Dockerfile for mariadb


FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server 

COPY ./tools/maridbScript.sh .

CMD ["bash", "maridbScript.sh"]