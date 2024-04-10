FROM postgres:14
LABEL authors="morrasan"

COPY init.sql /docker-entrypoint-initdb.d/
