FROM debian

WORKDIR /var/www/html

RUN apt update && apt upgrade -y && apt install -y php-mysql php-fpm curl vim

RUN sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/8.2/fpm/pool.d/www.conf

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /usr/local/bin/wp

COPY ./tools/wp.sh /home

ENTRYPOINT [ "sh", "/home/wp.sh" ]

CMD [ "php-fpm8.2", "-F" ]
