FROM  mcr.microsoft.com/dotnet/sdk:7.0 as build

WORKDIR /source

COPY *.csproj .

RUN dotnet restore

COPY . .

RUN dotnet publish -c Release -o /out

FROM mcr.microsoft.com/dotnet/runtime:7.0

RUN apt-get update && apt-get install -y postgresql-client redis-tools && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=build /out .

COPY worker-healthcheck.sh /app/worker-healthcheck.sh

RUN chmod +x /app/worker-healthcheck.sh

ENTRYPOINT ["dotnet","Worker.dll"]

