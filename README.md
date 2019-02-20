# docker-atlassian-sdk
Docker image for running atlas-mvn builds.

- Optional: Maven Artifactory connectivity via settings.xml

## Maven Artifactory Connectivity
We assume Artifactory repositories are setup as following:
- libs-local-release
- libs-local-snapshot
- libs-local (virtual for libs-local-release + libs-local-snapshot)

To enable Maven Artifactory connectivity, run the following
as part of your build (before calling `atlas-mvn`):

```
sh /enable-maven-artifactory.sh "<artifactory_context_url>" "<artifactory_username>" "<artifactory_password>"
```

**Attention:** None of the parameters may contain a space. For example, a password
containing spaces won't work.

This will replace the default Maven `settings.xml` file shipped by Atlassian
with a custom one that contains the necessary configurations.

For publishing, add this to your `pom.xml`:

```
<distributionManagement>
    <repository>
        <id>artifactory.libs-release-local</id>
        <url>${artifactory.context.url}/libs-release-local</url>
    </repository>
    <snapshotRepository>
        <id>artifactory.libs-snapshot-local</id>
        <url>${artifactory.context.url}/libs-snapshot-local</url>
    </snapshotRepository>
</distributionManagement>
```

When calling `atlas-mvn`, pass the Artifactory URL:

```
atlas-mvn compile -Dartifactory.context.url="..."
```
