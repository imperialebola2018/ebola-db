FROM postgres:10.3
ENV POSTGRES_DB postgres
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD changeme

# This is needed to override the loss of data that happens if you
# don't mount a persistent volume at the mount point.
ENV PGDATA /pgdata

COPY bin /usr/local/bin
COPY init/setup.sql /docker-entrypoint-initdb.d/
