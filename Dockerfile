FROM bitnami/php-fpm:7.4-prod AS php

COPY ./documentation/php-snpcurator.ini /opt/bitnami/php/etc/conf.d/php-snpcurator.ini
COPY . .
RUN chown daemon:daemon assembly_uploads study_uploads

########################################

FROM mysql/mysql-server:8.0 AS mysql

COPY documentation/dbSNPs.sql /docker-entrypoint-initdb.d/
