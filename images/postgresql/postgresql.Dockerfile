FROM postgres:10-alpine

EXPOSE 5432

COPY platform_database_initialize.sql /docker-entrypoint-initdb.d/