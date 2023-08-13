FROM composer:2.2.21 AS deps

WORKDIR /app
COPY composer.* .
RUN composer install --no-dev --ignore-platform-reqs

FROM php:8.2.7-apache AS runtime

RUN a2enmod rewrite

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions mysqli gd

WORKDIR /var/www/html
COPY server/php.ini $PHP_INI_DIR/php.ini
COPY server/server.conf /etc/apache2/sites-enabled/000-default.conf
COPY --chown=www-data:www-data --from=deps /app/vendor vendor/
COPY --chown=www-data:www-data --from=deps /app/web/wp web/wp/
COPY --chown=www-data:www-data --from=deps /app/web/app/mu-plugins web/app/mu-plugins/
COPY --chown=www-data:www-data --from=deps /app/web/app/plugins web/app/plugins/
COPY --chown=www-data:www-data . .