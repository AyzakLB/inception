FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y 

RUN apt-get install -y vsftpd 

COPY conf/vsftpd.conf /etc/vsftpd.conf

COPY tools/ftp_setup.sh /ftp_setup.sh


RUN chmod +x /ftp_setup.sh

EXPOSE 21

ENTRYPOINT ["/ftp_setup.sh"]
