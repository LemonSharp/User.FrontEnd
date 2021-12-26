﻿FROM node:latest AS nodeBase
WORKDIR /src
COPY ["nodejs", "./"]

RUN npm install


FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app 
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["User.FrontEnd.BFF/User.FrontEnd.BFF.csproj", "./"]
RUN dotnet restore "User.FrontEnd.BFF.csproj"
COPY . .
WORKDIR "/src/"
RUN dotnet build "User.FrontEnd.BFF.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "User.FrontEnd.BFF.csproj"-c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "User.FrontEnd.BFF.dll"]