FROM openjdk:8-jdk-alpine

ENV ATLAS_VERSION 8.0.7

# Dowload Atlassian SDK
RUN wget -O /opt/atlassian-plugin-sdk-${ATLAS_VERSION}.tar.gz \
         https://maven.atlassian.com/content/repositories/atlassian-public/com/atlassian/amps/atlassian-plugin-sdk/${ATLAS_VERSION}/atlassian-plugin-sdk-${ATLAS_VERSION}.tar.gz

# Install Atlassian SDK
RUN tar -C /opt -xf /opt/atlassian-plugin-sdk-${ATLAS_VERSION}.tar.gz

ENV PATH ${PATH}:/opt/atlassian-plugin-sdk-${ATLAS_VERSION}/bin
CMD ["atlas-version"]
