FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb_init.sh /tmp/mariadb_init.sh

RUN chmod +x /tmp/mariadb_init.sh

RUN /tmp/mariadb_init.sh

EXPOSE 3306

ENTRYPOINT ["mariadbd-safe"]