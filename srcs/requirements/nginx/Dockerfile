FROM debian:buster

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get install -y openssl && \
    apt install vim -y && \
    apt install curl -y


RUN mkdir /etc/nginx/ssl

RUN openssl req -x509 -nodes -newkey rsa:4096 \
    -out /etc/nginx/ssl/ntanjaou.crt \
    -keyout /etc/nginx/ssl/ntanjaou.key \
    -subj "/C=MA/L=KHOURIBGA/O=1337/CN=ntanjaou"

COPY ./conf/nginx.conf /etc/nginx/conf.d

COPY index.html /var/www/html

RUN mkdir -p /run/nginx

RUN chown -R www-data:www-data /var/www/html

RUN chmod 755 /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
