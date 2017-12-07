FROM anapsix/alpine-java:8_server-jre
LABEL maintainer "terje@offpiste.org"

ENV LOG_APPENDER stdout_json
ENV LOGGER_SLEEP 1000

COPY java/target/logger-test-jar-with-dependencies.jar /
CMD java -DLOG_APPENDER=$LOG_APPENDER -Dlogger.sleep=$LOGGER_SLEEP -jar /logger-test-jar-with-dependencies.jar

