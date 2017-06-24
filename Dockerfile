FROM debian:8.7

RUN apt-get update && \
    apt-get install -y python-pip


USER root
