FROM ghcr.io/cloudnative-pg/postgresql:15.5-debian as base
USER root
RUN apt update && apt install wget -y \
    && echo "deb https://packagecloud.io/timescale/timescaledb/debian/ bullseye main" | tee /etc/apt/sources.list.d/timescaledb.list \
    && wget --quiet -O - https://packagecloud.io/timescale/timescaledb/gpgkey | apt-key add - \
    && apt update \
    && apt install timescaledb-2-postgresql-15 -y

# RUN apt install gnupg postgresql-common apt-transport-https lsb-release wget
# apt-get update && apt install git
#    && git clone https://github.com/timescale/timescaledb \
#    && cd timescaledb \
#    && git checkout 2.9.1 \
#    && ./bootstrap \
#    && cd build && make \
#    && make install