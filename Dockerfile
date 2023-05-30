# syntax=docker/dockerfile:1

FROM maven:3.9.2-eclipse-temurin-11

RUN mkdir -p /home/app
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package
RUN cp /home/app/target/*.war /home/app/ztti.war

FROM tomee:17-jdk-9.0.0-M7-microprofile
ENV CATALINA_BASE="/usr/local/tomee"
ENV FILE_NAME="JAAS-Seminarium-1.0-SNAPSHOT.war"
COPY jaas.config "$CATALINA_BASE/conf/jaas.config"
ENV JAVA_OPTS="$JAVA_OPTS -Djava.security.auth.login.config==$CATALINA_BASE/conf/jaas.config"

COPY --from=0 "/home/app/ztti.war" "$CATALINA_BASE/webapps/$FILE_NAME"
EXPOSE 8080