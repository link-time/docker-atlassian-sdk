#!/bin/bash

# ------------------------------------------------------------
# Overwrites the default Atlassian SDK Maven settings.xml file with
# a custom one containing the configuration for Artifactory.
# ------------------------------------------------------------

if [[ "$#" -ne 3 ]]; then
    echo "Usage: $0 <artifactoryContextUrl> <artifactoryUsername> <artifactoryPassword>"
    exit 1
fi

ARTIFACTORY_CONTEXT_URL=$1
ARTIFACTORY_USERNAME=$2
ARTIFACTORY_PASSWORD=$3

MAVEN_CONFIG_DIRECTORY="/opt/atlassian-plugin-sdk-${ATLAS_VERSION}/apache-maven-${ATLAS_MAVEN_VERSION}/conf"

sed -i "s %%ARTIFACTORY_CONTEXT_URL%% ${ARTIFACTORY_CONTEXT_URL} g" ${MAVEN_CONFIG_DIRECTORY}/settings.xml.artifactory
sed -i "s %%ARTIFACTORY_USERNAME%% ${ARTIFACTORY_USERNAME} g" ${MAVEN_CONFIG_DIRECTORY}/settings.xml.artifactory
sed -i "s %%ARTIFACTORY_PASSWORD%% ${ARTIFACTORY_PASSWORD} g" ${MAVEN_CONFIG_DIRECTORY}/settings.xml.artifactory
cp ${MAVEN_CONFIG_DIRECTORY}/settings.xml.artifactory ${MAVEN_CONFIG_DIRECTORY}/settings.xml
