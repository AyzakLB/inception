FROM debian:bullseye

RUN apt-get update && apt-get install -y curl ca-certificates \
    && curl -L https://github.com/portainer/portainer/releases/download/2.21.3/portainer-2.21.3-linux-amd64.tar.gz -o portainer.tar.gz \
    && tar -xzf portainer.tar.gz -C /opt \
    && mv /opt/portainer /usr/local/bin/portainer \
    && rm portainer.tar.gz \
    && chmod +x /usr/local/bin/portainer

EXPOSE 9443

CMD ["/usr/local/bin/portainer", "run", "--bind=:9443", "--data=/data"]
