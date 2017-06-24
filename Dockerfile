FROM debian:8.7

RUN apt-get update && \
    apt-get install -y python-pip


RUN apt-get install git curl

RUN curl -L -O -H 'Cookie: oraclelicense=accept-securebackup-cookie' -k http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz 

RUN tar zxf jdk*.tar.gz
