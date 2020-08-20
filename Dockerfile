FROM bitnami/php-fpm:7.4-prod AS dev

RUN echo "auto_detect_line_endings = On" >> /opt/bitnami/php/etc/conf.d/php.overrides.ini \
  && echo "max_execution_time = 0" >> /opt/bitnami/php/etc/conf.d/php.overrides.ini \
  && echo "max_input_time = -1" >> /opt/bitnami/php/etc/conf.d/php.overrides.ini \
  && echo "memory_limit = 2G" >> /opt/bitnami/php/etc/conf.d/php.overrides.ini \
  && echo "post_max_size = 50G" >> /opt/bitnami/php/etc/conf.d/php.overrides.ini \
  && echo "upload_max_filesize = 50G" >> /opt/bitnami/php/etc/conf.d/php.overrides.ini

USER daemon

ENTRYPOINT php -S 0.0.0.0:8080 -c /opt/bitnami/php/etc/php.ini-development
