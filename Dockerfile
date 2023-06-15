FROM alpine:3.18

MAINTAINER thatsk

ENV JMETER_VERSION 3.1
ENV JMETER_HOME /var/lib/apache-jmeter-${JMETER_VERSION}
ENV JMETER_BIN $JMETER_HOME/bin
RUN echo "ipv6" >> /etc/modules
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
 && apk add --update curl openjdk8 tar unzip bash && rm -rf /var/cache/apk/*

COPY dependencies /tmp/dependencies

RUN tar -xzf /tmp/dependencies/apache-jmeter-${JMETER_VERSION}.tgz -C /var/lib && \
    unzip -oq "/tmp/dependencies/JMeterPlugins-*.zip" -d $JMETER_HOME && \
    rm -rf /tmp/dependencies

ENV PATH $PATH:$JMETER_BIN
