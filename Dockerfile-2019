FROM mcr.microsoft.com/mssql/server:2019-latest

WORKDIR /usr/src/app

COPY --chmod=755 scripts /usr/src/app

ENV SA_PASSWORD @Alfresco2017@
ENV ACCEPT_EULA Y

EXPOSE 1433

CMD /bin/bash /usr/src/app/entrypoint.sh