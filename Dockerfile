FROM php:5.4-apache
MAINTAINER <Stephen Lawrence>

# Install packages
RUN apt-get update && \
apt-get install -y apt-utils php5-mysql git

# PHP prod config
ADD files/php.ini  /usr/local/etc/php/
ADD files/config.php /config.php
ADD files/web-startup.sh /web-startup.sh

RUN chmod 700 /web-startup.sh

EXPOSE 80

# By default, simply start apache.
CMD ["/web-startup.sh"]
