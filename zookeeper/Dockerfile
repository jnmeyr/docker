FROM openjdk:8-alpine

ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk/
ENV ZOOKEEPER_MIRROR https://www-eu.apache.org
ENV ZOOKEEPER_VERSION 3.4.13
ENV ZOOKEEPER_HOME /opt/zookeeper-${ZOOKEEPER_VERSION}

RUN apk add wget gnupg tar && \
    cd /tmp && \
    wget -q ${ZOOKEEPER_MIRROR}/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz && \
    wget -q ${ZOOKEEPER_MIRROR}/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz.asc && \
    wget -q ${ZOOKEEPER_MIRROR}/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz.md5 && \
    wget -q ${ZOOKEEPER_MIRROR}/dist/zookeeper/KEYS && \
    md5sum -c zookeeper-${ZOOKEEPER_VERSION}.tar.gz.md5 && \
    gpg --no-tty --import KEYS && \
    gpg --verify zookeeper-${ZOOKEEPER_VERSION}.tar.gz.asc && \
    mkdir /opt && \
    tar -xzf /tmp/zookeeper-${ZOOKEEPER_VERSION}.tar.gz -C /opt && \
    mkdir ${ZOOKEEPER_HOME}/data && \
    cd / && \
    rm -rf /tmp/*

EXPOSE 2181 2888 3888
VOLUME ["${ZOOKEEPER_HOME}/conf", "${ZOOKEEPER_HOME}/data"]

WORKDIR ${ZOOKEEPER_HOME}
CMD ${ZOOKEEPER_HOME}/bin/zkServer.sh start-foreground
