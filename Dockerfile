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
RUN cp target/*.war $TOMCAT_APPS/app.war

EXPOSE 8080

ENV CATALINA_BASE   /usr/local/tomcat

# Копируем файл server.xml по адресу /usr/local/conf/server.xml
# Файл взят отсюда: https://github.com/apache/tomcat/blob/master/conf/server.xml
ADD server.xml /usr/local/conf/server.xml

# Еще нехватает /usr/local/conf/tomcat-users.xml
ADD tomcat-users.xml /usr/local/conf/tomcat-users.xml

# Cервер запускается, но .war не видит, выдает в браузере ошибку 404
# Попробуем закинуть еще файлов с конфигами, может поможет
ADD tomcat-users.xsd /usr/local/conf/tomcat-users.xsd
# Добавление tomcat-users.xsd не помогло
ADD web.xml /usr/local/conf/web.xml
# Добавление web.xml не помогло, но может в корень положить index.html?

CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]