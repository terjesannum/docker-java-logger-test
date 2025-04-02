FROM maven:3.9.9-eclipse-temurin-23 as builder

ARG PROFILE
ENV PROFILE=${PROFILE:-logback}

COPY java /java
WORKDIR /java
RUN mvn -P $PROFILE package


FROM eclipse-temurin:24
LABEL maintainer "terje@offpiste.org"

ENV LOGGER_SLEEP 1000
ENV LOGGER_MESSAGE_MIN_LENGTH 10
ENV LOGGER_MESSAGE_MAX_LENGTH 40

COPY --from=builder /java/target/logger-test-jar-with-dependencies.jar /
CMD java -DLOG_APPENDER=$LOG_APPENDER -Dlogger.sleep=$LOGGER_SLEEP -Dlogger.message.minLength=$LOGGER_MESSAGE_MIN_LENGTH -Dlogger.message.maxLength=$LOGGER_MESSAGE_MAX_LENGTH -jar /logger-test-jar-with-dependencies.jar
