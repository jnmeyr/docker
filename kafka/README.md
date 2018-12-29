# Kafka #

## Versions ##
Scala Version 2.12
Kafka 2.1.0

## Configuration ##
docker build --rm -t jnmeyr/kafka .
docker tag jnmeyr/kafka:latest marlene:5000/jnmeyr/kafka:latest
docker push marlene:5000/jnmeyr/kafka

## Run ##
docker run -d -p 9092:9092 \
  --env ADVERTISED_HOST=kafka-0 \
  --env ADVERTISED_PORT=9092 \
  --env ZOOKEEPER_CONNECT=zookeeper:2181 \
  --name kafka-0 \
  --network kafkas \
  jnmeyr/kafka:latest
