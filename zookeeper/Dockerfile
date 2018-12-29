FROM openjdk:8-alpine

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
    ZOOKEEPER_MIRROR=https://www-eu.apache.org \
    ZOOKEEPER_VERSION=3.4.13 \
    ZOOKEEPER_HOME=/opt/zookeeper

RUN cd /tmp && \
    apk add --no-cache wget gnupg tar bash && \
    wget -q ${ZOOKEEPER_MIRROR}/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz && \
    wget -q ${ZOOKEEPER_MIRROR}/dist/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz.asc && \
    wget -q ${ZOOKEEPER_MIRROR}/dist/zookeeper/KEYS && \
    gpg --import KEYS && \
    gpg --verify zookeeper-${ZOOKEEPER_VERSION}.tar.gz.asc zookeeper-${ZOOKEEPER_VERSION}.tar.gz && \
    mkdir /opt && \
    tar xzf zookeeper-${ZOOKEEPER_VERSION}.tar.gz && \
    mv zookeeper-${ZOOKEEPER_VERSION} ${ZOOKEEPER_HOME} && \
    mkdir ${ZOOKEEPER_HOME}/data && \
    cd / && \
    rm -rf /tmp/*

COPY zoo.cfg ${ZOOKEEPER_HOME}/conf/zoo.cfg
EXPOSE 2181 2888 3888
VOLUME ["${ZOOKEEPER_HOME}/conf", "${ZOOKEEPER_HOME}/data"]
WORKDIR ${ZOOKEEPER_HOME}
CMD ${ZOOKEEPER_HOME}/bin/zkServer.sh start-foreground
