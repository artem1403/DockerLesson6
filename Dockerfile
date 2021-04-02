FROM ubuntu:20.04

RUN apt update \
    && apt install default-jdk -y \
    && apt install tomcat9 -y \
    && apt install maven -y

ADD JCloisterZone/ JCloisterZone/

WORKDIR /JCloisterZone/

RUN mvn package