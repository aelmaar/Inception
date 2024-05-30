FROM debian:bookworm

RUN apt update && apt upgrade -y && apt install -y nginx openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/CN=ael-maar.42.fr"

COPY ./conf/wp.conf /etc/nginx/conf.d

# Redirect nginx logs to stdout and stderr
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;"]
