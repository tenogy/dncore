FROM mcr.microsoft.com/dotnet/core/sdk:3.0.100-preview4-alpine3.9 AS build
WORKDIR /src
COPY src .
RUN dotnet publish -c Release -o /app

FROM tenogy/blank AS src
WORKDIR /app
COPY --from=build /app ./
