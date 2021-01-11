FROM php:8.0-apache
WORKDIR /app
COPY . /app

RUN apt-get update && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
  php composer-setup.php --install-dir /usr/local/bin && \
  ln -s /usr/local/bin/composer.phar /usr/local/bin/composer && \
  unlink composer-setup.php

EXPOSE 8080
CMD [ "php", "-S", "0.0.0.0:8080", "-t", "public"]