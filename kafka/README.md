# Kafka #

## Versions ##
Java 8
Scala 2.12
Kafka 2.1.0

## Configuration ##
docker build --rm -t jnmeyr/kafka .
docker tag jnmeyr/kafka:latest marlene:5000/jnmeyr/kafka:latest
docker push marlene:5000/jnmeyr/kafka

## Run ##
docker run -d -p 9092:9092 \
  --env ADVERTISED_HOST_NAME=192.168.0.110 \
  --env ADVERTISED_PORT=9092 \
  --env BROKER_ID=0 \
  --env ZOOKEEPER_CONNECT=zookeeper:2181 \
  --name kafka-0 \
  --network kafkas \
  jnmeyr/kafka:latest
docker run -d -p 9093:9092 \
  --env ADVERTISED_HOST_NAME=192.168.0.110 \
  --env ADVERTISED_PORT=9093 \
  --env BROKER_ID=1 \
  --env ZOOKEEPER_CONNECT=zookeeper:2181 \
  --name kafka-1 \
  --network kafkas \
  jnmeyr/kafka:latest
