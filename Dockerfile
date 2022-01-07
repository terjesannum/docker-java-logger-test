FROM maven:3.8.4-jdk-8 as builder

ARG PROFILE
ENV PROFILE=${PROFILE:-logback}

COPY java /java
WORKDIR /java
RUN mvn -P $PROFILE package


FROM openjdk:8-jre-slim
LABEL maintainer "terje@offpiste.org"

ENV LOG_APPENDER stdout_json
ENV LOG_MAX_SIZE 5MB
ENV LOG_FILE /var/log/json.log
ENV LOGGER_SLEEP 1000

COPY --from=builder /java/target/logger-test-jar-with-dependencies.jar /
CMD java -DLOG_APPENDER=$LOG_APPENDER -Dlogger.sleep=$LOGGER_SLEEP -jar /logger-test-jar-with-dependencies.jar

