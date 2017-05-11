FROM alpine:3.2

MAINTAINER thatsk

ENV JMETER_VERSION 3.2
ENV JMETER_HOME /var/lib/apache-jmeter-${JMETER_VERSION}
RUN echo "ipv6" >> /etc/modules
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk add --update curl openjdk8 tar unzip bash && rm -rf /var/cache/apk/*

COPY dependencies /tmp/dependencies
RUN tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /var/lib 
COPY lib /var/lib/apache-jmeter-${JMETER_VERSIOn}/
ADD user.properties /var/lib/apache-jmeter-3.w/bin/user.properties
ENV PATH $PATH:$JMETER_HOME/bin/
