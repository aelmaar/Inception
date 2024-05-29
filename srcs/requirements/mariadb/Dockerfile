FROM debian

RUN apt update && apt upgrade -y
RUN apt install -y mariadb-server mariadb-client vim curl
RUN sed -i 's/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/script.sh /setup.sh
RUN chmod +x /setup.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/setup.sh"]

CMD [ "mysqld_safe" ]
