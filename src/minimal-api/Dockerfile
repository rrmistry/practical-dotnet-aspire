# Get to a version-less dotnet dependency (framework dependency)
# Break out 1 app at a time into new model (isolated containers doing focused things)

FROM mcr.microsoft.com/dotnet/sdk:latest AS base

WORKDIR /app

# https://www.nuget.org/packages/dotnet-script/
RUN dotnet tool install dotnet-script --tool-path /usr/bin

COPY . .

ENTRYPOINT [ "dotnet" , "script", "main.csx" ]
