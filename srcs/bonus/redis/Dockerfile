FROM debian:bullseye
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y lsb-release curl gpg
RUN curl -fsSL https://packages.redis.io/gpg |  gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
RUN chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" |  tee /etc/apt/sources.list.d/redis.list
RUN apt-get install -y redis

COPY conf/redis.conf /usr/local/etc/redis/redis.conf

EXPOSE 6379

ENTRYPOINT [ "redis-server", "/usr/local/etc/redis/redis.conf" ]