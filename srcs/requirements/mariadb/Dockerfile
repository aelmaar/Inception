FROM debian

RUN apt update && apt upgrade -y
RUN apt install -y mariadb-server mariadb-client vim curl
RUN mkdir -p /run/mysqld && chmod 777 /run/mysqld

COPY ./tools/script.sh /setup.sh
RUN chmod +x /setup.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/setup.sh"]

CMD [ "mariadbd", "--user=mysql", "--bind-address=0.0.0.0" ]
