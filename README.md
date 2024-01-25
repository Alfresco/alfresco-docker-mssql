# Alfresco Docker for MS SQL Server

**_Note: This project is for internal development and testing purposes only._**

These are the supported MSSQL versions for the currently (Jan 2024) supported ACS Versions

||2017|2019|
|---|---|---|
|7.0|&#10004;|&#10004;|
|7.1|&#10004;|&#10004;|
|7.2|&#10004;|&#10004;|
|7.3||&#10004;|
|7.4||&#10004;|
|23||&#10004;|

The image is created with the base alfresco database.

It uses the default account `sa` with the password `@Alfresco2017@`

For acs configuration you should use the [documentation](https://docs.alfresco.com/content-services/latest/config/databases/#microsoft-sql-server) for the MS SQL Server. We do enable snapshot isolation by default.

## Example Docker Compose Configuration

Define the service
(assumes the image was created with the name `alfresco-mssql`)
```
  mssql:
    image: alfresco-mssql:latest
    mem_limit: 1g
    ports:
        - "1433:1433"
```
Database configuration for the `alfresco` service.  This is added to `JAVA_OPTS`
```
    -Ddb.driver=com.microsoft.sqlserver.jdbc.SQLServerDriver
    -Ddb.username=sa
    -Ddb.password=@Alfresco2017@
    -Ddb.pool.max=275
    -Ddb.txn.isolation=4096
    -Ddb.url="jdbc:sqlserver://mssql:1433;databaseName=alfresco;lockTimeout=1000;"
```
The jdbc driver is added through a volume bind (It is important that you use the approprite supported driver for the version MS SQL you are using see [Supported Platforms and Languages](https://www.alfresco.com/services/subscription/supported-platforms))
```
  volumes:
    - type: bind
    source: ./mssql-jdbc-9.2.1.jre11.jar
    target: /usr/local/tomcat/lib/mssql-jdbc-9.2.1.jre11.jar
```
