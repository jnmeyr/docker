# Zookeeper #

## Versions ##
Java 8
Zookeeper 3.4.13

## Configuration ##
Ports 2181 2888 3888

## Build and Push ##
docker build --rm -t jnmeyr/zookeeper .
docker tag jnmeyr/zookeeper:latest marlene:5000/jnmeyr/zookeeper:latest
docker push marlene:5000/jnmeyr/zookeeper 
