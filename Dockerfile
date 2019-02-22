FROM openjdk:8-jdk-alpine

ENV ATLAS_VERSION 8.0.7
ENV ATLAS_MAVEN_VERSION 3.5.4

# Install misc tools
RUN apk add --no-cache \
            git \
            openssh \
            curl

# Dowload Atlassian SDK
RUN wget -O /opt/atlassian-plugin-sdk-${ATLAS_VERSION}.tar.gz \
         https://maven.atlassian.com/content/repositories/atlassian-public/com/atlassian/amps/atlassian-plugin-sdk/${ATLAS_VERSION}/atlassian-plugin-sdk-${ATLAS_VERSION}.tar.gz

# Install Atlassian SDK
RUN tar -C /opt -xf /opt/atlassian-plugin-sdk-${ATLAS_VERSION}.tar.gz && \
    rm /opt/atlassian-plugin-sdk-${ATLAS_VERSION}.tar.gz

# On-demand Maven Artifactory connectivity
COPY settings.xml /opt/atlassian-plugin-sdk-${ATLAS_VERSION}/apache-maven-${ATLAS_MAVEN_VERSION}/conf/settings.xml.artifactory
COPY enable-maven-artifactory.sh /
RUN chmod 700 /enable-maven-artifactory.sh

ENV PATH ${PATH}:/opt/atlassian-plugin-sdk-${ATLAS_VERSION}/bin
CMD ["atlas-version"]
