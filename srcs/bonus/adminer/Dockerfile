FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y php7.4-cli php7.4-mysqli wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

RUN wget https://www.adminer.org/latest.php -O index.php

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]
