FROM debian:8.7

RUN apt-get update && \
    apt-get install -y python-pip


RUN apt-get -y install git curl

RUN curl -L -O -H 'Cookie: oraclelicense=accept-securebackup-cookie' -k http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz 

RUN tar zxf jdk*.tar.gz

RUN ls -la

RUN update-alternatives --install /usr/bin/java java /jdk1.8.0_131/bin/java 100


RUN java -version


RUN curl -L -O -k http://artfiles.org/apache.org/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz

RUN tar zxf apache-maven*.tar.gz

RUN ls -la /apache-maven-3.5.0

RUN update-alternatives --install /usr/bin/mvn mvn /apache-maven-3.5.0/bin/mvn 101


RUN curl -L -O -k  https://services.gradle.org/distributions/gradle-4.0-bin.zip
RUN apt-get install -y unzip

RUN unzip gradle-4.0-bin.zip -d .

RUN ls -la /gradle-4.0

RUN update-alternatives --install /usr/bin/gradle gradle /gradle-4.0/bin/gradle 102


RUN curl -L -O -k   https://releases.hashicorp.com/terraform/0.9.8/terraform_0.9.8_linux_amd64.zip

RUN unzip terraform_0.9.8_linux_amd64.zip -d /terraform_0.9.8_linux_amd64

RUN ls -la /terraform_0.9.8_linux_amd64

RUN update-alternatives --install /usr/bin/terraform terraform /terraform_0.9.8_linux_amd64/terraform 103

ADD requirements.txt /requirements.txt

RUN pip install -r /requirements.txt
