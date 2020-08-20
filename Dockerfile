FROM php:7.4-apache

RUN docker-php-ext-install pdo_mysql

RUN ln -s ${PHP_INI_DIR}/php.ini-development ${PHP_INI_DIR}/php.ini \
  && echo "auto_detect_line_endings = On" >> ${PHP_INI_DIR}/conf.d/php.overrides.ini \
  && echo "display_errors_startup = On" >> ${PHP_INI_DIR}/conf.d/php.overrides.ini \
  && echo "error_log = stderr" >> ${PHP_INI_DIR}/conf.d/php.overrides.ini \
  && echo "max_execution_time = 0" >> ${PHP_INI_DIR}/conf.d/php.overrides.ini \
  && echo "max_input_time = -1" >> ${PHP_INI_DIR}/conf.d/php.overrides.ini \
  && echo "memory_limit = 2G" >> ${PHP_INI_DIR}/conf.d/php.overrides.ini \
  && echo "post_max_size = 50G" >> ${PHP_INI_DIR}/conf.d/php.overrides.ini \
  && echo "upload_max_filesize = 50G" >> ${PHP_INI_DIR}/conf.d/php.overrides.ini
