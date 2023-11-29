FROM ghcr.io/cloudnative-pg/postgresql:16.1-debian as base
USER root
RUN apt update && apt install wget -y \
    && echo "deb https://packagecloud.io/timescale/timescaledb/debian/ bullseye main" | tee /etc/apt/sources.list.d/timescaledb.list \
    && wget --quiet -O - https://packagecloud.io/timescale/timescaledb/gpgkey | apt-key add - \
    && apt update \
    && apt install timescaledb-2-postgresql-16 -y
