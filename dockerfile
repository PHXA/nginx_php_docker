FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo 

RUN apt-get update && apt-get install -y tzdata
RUN apt-get install -y nginx php-fpm
RUN apt-get install -y vim

COPY default /etc/nginx/sites-available/default
COPY laravel /laravel
COPY ./init.sh /init.sh
RUN chmod 744 /init.sh
RUN chmod -R 777 /laravel

CMD /init.sh
