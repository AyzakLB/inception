FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx

COPY website /var/www/html

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]