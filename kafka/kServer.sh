#!/bin/sh

echo "" >> $KAFKA_HOME/config/server.properties

if [ ! -z "$ADVERTISED_HOST" ]; then
    if grep -q "^advertised.host.name" $KAFKA_HOME/config/server.properties; then
        sed -r -i "s/advertised.host.name=(.*)/advertised.host.name=$ADVERTISED_HOST/g" $KAFKA_HOME/config/server.properties
    else
        echo "advertised.host.name=$ADVERTISED_HOST" >> $KAFKA_HOME/config/server.properties
    fi
fi

if [ ! -z "$ADVERTISED_PORT" ]; then
    if grep -q "^advertised.port" $KAFKA_HOME/config/server.properties; then
        sed -r -i "s/advertised.port=(.*)/advertised.port=$ADVERTISED_PORT/g" $KAFKA_HOME/config/server.properties
    else
        echo "advertised.port=$ADVERTISED_PORT" >> $KAFKA_HOME/config/server.properties
    fi
fi

if [ ! -z "$ZOOKEEPER_CONNECT" ]; then
    if grep -q "^zookeeper.connect" $KAFKA_HOME/config/server.properties; then
        sed -r -i "s/zookeeper.connect=(.*)/zookeeper.connect=$ZOOKEEPER_CONNECT/g" $KAFKA_HOME/config/server.properties
    else
        echo "zookeeper.connect=$ZOOKEEPER_CONNECT" >> $KAFKA_HOME/config/server.properties
    fi
fi

$KAFKA_HOME/bin/kafka-server-start.sh $KAFKA_HOME/config/server.properties
