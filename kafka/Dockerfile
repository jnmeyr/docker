FROM openjdk:8-alpine

ENV SCALA_VERSION=2.12 \
    KAFKA_MIRROR=https://www-eu.apache.org \
    KAFKA_VERSION=2.1.0 \
    KAFKA_HOME=/opt/kafka \
    GLIBC_MIRROR=https://github.com/sgerrand/alpine-pkg-glibc/releases/download \
    GLIBC_VERSION=2.28-r0

COPY kServer.sh /tmp/kServer.sh

RUN cd /tmp && \
    apk add --no-cache wget gnupg tar bash && \
    wget -q ${KAFKA_MIRROR}/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    wget -q ${KAFKA_MIRROR}/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz.asc && \
    wget -q ${KAFKA_MIRROR}/dist/kafka/KEYS && \
    gpg --import KEYS && \
    gpg --verify kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz.asc kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    mkdir /opt && \
    tar xfz kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    mv kafka_${SCALA_VERSION}-${KAFKA_VERSION} ${KAFKA_HOME} && \
    chmod +x kServer.sh && \
    mv kServer.sh ${KAFKA_HOME}/bin/kServer.sh && \
    mkdir ${KAFKA_HOME}/data && \
    wget -q ${GLIBC_MIRROR}/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
    apk add --no-cache --allow-untrusted glibc-${GLIBC_VERSION}.apk && \
    cd / && \
    rm -rf /tmp/*

EXPOSE 9092
VOLUME ["${KAFKA_HOME}/data"]
WORKDIR ${KAFKA_HOME}
CMD ${KAFKA_HOME}/bin/kServer.sh
