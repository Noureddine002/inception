FROM debian:buster

RUN apt-get update && \
    apt-get -y install wget && \
    apt-get install -y php7.3 php-fpm php-mysql curl

COPY tools/script.sh /

CMD ["bash","script.sh"]