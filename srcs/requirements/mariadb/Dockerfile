FROM debian:buster

RUN apt-get update && \
    apt-get install mariadb-server -y && \
    apt install vim -y

COPY ./conf/50-server.cnf   /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mariadb.sh /

RUN chmod +x mariadb.sh

CMD ["bash", "mariadb.sh"]