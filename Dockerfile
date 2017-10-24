FROM debian:9
MAINTAINER David Bennett <david.bennett@percona.com>

ARG GIT_CHECKOUT

WORKDIR /root

RUN apt-get update \
  && apt-get install -y git gcc g++ libpq-dev make automake libtool pkg-config libaio-dev vim-common postgresql-client \
  && cd /root \
  && git clone https://github.com/akopytov/sysbench.git \
  && cd /root/sysbench \
  && git checkout $GIT_CHECKOUT \
  && ./autogen.sh \
  && ./configure --without-mysql --with-pgsql \
  && make \
  && make install \
  && make clean

COPY "compile_sysbench.sh" /root
COPY "run_sysbench.sh" /root
COPY "intro_message.sh" /root

ENTRYPOINT ["./intro_message.sh"]
