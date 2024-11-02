FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

COPY pinballv7.html /var/www/html/

EXPOSE 80

CMD ["apachect1", "-D", "FOREGROUND"]
