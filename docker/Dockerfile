# Dockerfile
# from https://runnable.com/docker/java/dockerize-your-java-application

FROM  phusion/baseimage:0.9.17

MAINTAINER  Author Name <wuyg719@gmail.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list

RUN apt-get -y update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-software-properties software-properties-common

