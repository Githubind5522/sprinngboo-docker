With Java:
=========

FROM java:8
ADD ./target/gs-spring-boot-0.1.0.jar app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-jar","app.jar"]


with amazonlinux:
================

FROM amazonlinux
RUN yum install maven -y
RUN yum install git maven java-1.8* -y
WORKDIR /opt
RUN git clone https://github.com/logambigaik/sprinngboo-docker.git
WORKDIR /opt/sprinngboo-docker
RUN mvn clean install
WORKDIR /opt/sprinngboo-docker/target
RUN mv gs-spring-boot-0.1.0.jar app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-jar","app.jar"]

