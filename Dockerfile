FROM ubi8/ubi:latest
ARG http_proxy
ARG https_proxy
ARG no_proxy
# reverse engineering core components of https://github.com/jboss-container-images/openjdk/blob/develop/ubi8-openjdk-11.yaml
# modules source: https://github.com/jboss-openshift/cct_module
# source: jboss.container.user

ENV HOME=/home/jboss
WORKDIR /home/jboss

# source: jboss.container.openjdk.11

ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0 \
    JAVA_VENDOR=openjdk \
    JAVA_VERSION=1.8.0

RUN groupadd -r jboss -g 185 && \
    useradd -u 185 -r -g jboss -m -d /home/jboss -s /sbin/nologin -c "JBoss user" jboss && \
    chmod ug+rwX /home/jboss

# source: jboss.container.user

USER 185
