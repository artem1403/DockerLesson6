FROM ubuntu:20.04

RUN apt update \
    && apt install default-jdk -y \
    && apt install tomcat9 -y \
    && apt install maven -y

ADD appengine-java-vm-sudoku-sample/ appengine-java-vm-sudoku-sample/

WORKDIR /appengine-java-vm-sudoku-sample/

RUN mvn package

# copy .war-file in tomcat web-folder
ENV TOMCAT_APPS /var/lib/tomcat9/webapps
RUN cp target/*.war $TOMCAT_APPS/ 

EXPOSE 8080

# Контейнер выключается сразу после старта :(
CMD ["echo", "Hello!"]