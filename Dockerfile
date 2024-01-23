FROM mcr.microsoft.com/mssql/server:2017-latest-ubuntu

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY scripts /usr/src/app

RUN chmod +x /usr/src/app/run-initialization.sh

ENV SA_PASSWORD @Alfresco2017@
ENV ACCEPT_EULA Y

EXPOSE 1433

CMD /bin/bash /usr/src/app/entrypoint.sh