FROM maven:3.9.9-eclipse-temurin-23 AS builder

ARG PROFILE
ENV PROFILE=${PROFILE:-logback}

COPY java /java
WORKDIR /java
RUN mvn -P $PROFILE package


FROM eclipse-temurin:23
LABEL maintainer="terje@offpiste.org"

ENV LOGGER_SLEEP=1000
ENV LOGGER_MESSAGE_MIN_LENGTH=10
ENV LOGGER_MESSAGE_MAX_LENGTH=20

ENV LOGBACK_CONFIG_FILE=logback.xml
ENV LOG4J2_CONFIG_FILE=log4j2.xml

COPY --from=builder /java/target/logger-test.jar /
CMD sh -c 'exec java -Dlogger.sleep=$LOGGER_SLEEP -Dlogger.message.minLength=$LOGGER_MESSAGE_MIN_LENGTH -Dlogger.message.maxLength=$LOGGER_MESSAGE_MAX_LENGTH -Dlogback.configurationFile=$LOGBACK_CONFIG_FILE -Dlog4j2.configurationFile=$LOG4J2_CONFIG_FILE -Dlog4j2.configurationFactory=org.apache.logging.log4j.core.config.xml.XmlConfigurationFactory -jar /logger-test.jar'
