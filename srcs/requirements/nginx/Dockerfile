FROM debian

RUN apt update && apt upgrade -y && apt install -y nginx curl vim
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/CN=ael-maar.42.fr"

COPY ./tools/wp.conf /etc/nginx/conf.d

EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;"]
