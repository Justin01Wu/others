#!/bin/bash


echo "start Kafak on 9092"

/usr/kafka/kafka_2.12-2.1.0/bin/zookeeper-server-start.sh /usr/kafka/kafka_2.12-2.1.0/config/zookeeper.properties > /var/log/zookeeper.out &

/usr/kafka/kafka_2.12-2.1.0/bin/kafka-server-start.sh /usr/kafka/kafka_2.12-2.1.0/config/server.properties > /var/log/kafka.out &


