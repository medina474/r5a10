FROM postgres:16.4

RUN set -eux; \
  apt-get update; \
  apt-get -y install \
    postgresql-16-age \
    postgresql-16-cron \
    postgresql-16-http \
    postgresql-16-pgvector;

# pg_net
# The PG_NET extension enables PostgreSQL to make asynchronous HTTP/HTTPS requests in SQL.
# insIt eliminates the need for servers to continuously poll for database changes and instead allows the database to proactively notify external resources about significant events.

RUN set -eux; \
  apt-get update; \
  apt-get -y install \
    postgresql-16-postgis-3 \
    postgresql-16-pgrouting;

RUN set -eux; \
  apt-get update; \
  apt-get -y install \
    postgresql-16-pgtap;
