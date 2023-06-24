FROM debian:buster

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get install -y openssl

RUN mkdir /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/ntanjaou.crt \
    -keyout /etc/nginx/ssl/ntanjaou.key \
    -subj "/C=MA/L=KHOURIBGA/O=1337/CN=ntanjaou"


COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
