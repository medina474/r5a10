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
# It eliminates the need for servers to continuously poll for database changes and instead allows the database to proactively notify external resources about significant events.

RUN set -eux; \
  apt-get update; \
  apt-get -y install \
    postgresql-16-postgis-3 \
    postgresql-16-pgrouting;

RUN set -eux; \
  apt-get update; \
  apt-get -y install \
    postgresql-16-pgtap;

RUN set -eux; \
  apt-get update; \
  apt-get -y install \
    wget;

RUN mkdir -p /docker-entrypoint-data.d; \
  chown postgres:postgres /docker-entrypoint-data.d;\
  chmod 700 /docker-entrypoint-data.d;

WORKDIR /tmp

ADD https://github.com/VADOSWARE/pg_idkit/releases/download/v0.2.4/pg_idkit-0.2.4-pg16-gnu.tar.gz ./
RUN set -eux; \
  tar xf pg_idkit-0.2.4-pg16-gnu.tar.gz; \ 
  mv pg_idkit-0.2.4/lib/postgresql/* /usr/lib/postgresql/16/lib; \
  mv pg_idkit-0.2.4/share/postgresql/extension/* /usr/share/postgresql/16/extension;

RUN sed -i "s/#shared_preload_libraries = ''/shared_preload_libraries = '\/usr\/lib\/postgresql\/16\/lib\/pg_idkit.so'/" /usr/share/postgresql/postgresql.conf.sample
#RUN echo "shared_preload_libraries = '/etc/postgresql/extensions/pg_idkit-vX.X.X.so'" >> /usr/share/postgresql/postgresql.conf.sample


ADD https://github.com/prometheus-community/postgres_exporter/releases/download/v0.15.0/postgres_exporter-0.15.0.linux-amd64.tar.gz ./
RUN set -eux; \
  tar xfz postgres_exporter-0.15.0.linux-amd64.tar.gz; \
  mv postgres_exporter-0.15.0.linux-amd64/postgres_exporter /usr/bin/;


WORKDIR /docker-entrypoint-data.d
