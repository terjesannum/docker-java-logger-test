FROM anapsix/alpine-java:8_server-jre
LABEL maintainer "terje@offpiste.org"

ENV SYSLOG_HOST syslog
ENV SYSLOG_PORT 514
ENV SYSLOG_FACILITY local1
ENV LOG_APPENDER stdout

COPY java/target/logger-test-jar-with-dependencies.jar /
CMD java -DSYSLOG_HOST=$SYSLOG_HOST -DSYSLOG_PORT=$SYSLOG_PORT -DSYSLOG_FACILITY=$SYSLOG_FACILITY -DLOG_APPENDER=$LOG_APPENDER -jar /logger-test-jar-with-dependencies.jar

