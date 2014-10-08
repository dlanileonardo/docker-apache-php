#
# MongoDB Dockerfile
#
# https://github.com/dockerfile/mongodb
#

# Pull base image.
FROM ubuntu:14.04

ENV SHELL /bin/bash
MAINTAINER Odlanier Mendes <dlanileonardo@gmail.com>

# Install packages
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install supervisor
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install git
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libapache2-mod-php5
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install php5-mysql
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install pwgen
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install php-apc
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install php5-gd
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install php5-mcrypt

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

# config to enable .htaccess
ADD apache_default /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

EXPOSE 80
CMD ["/run.sh"]