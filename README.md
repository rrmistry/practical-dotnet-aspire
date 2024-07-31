# The Coffeeshop Apps on .NET Aspire

The coffeeshop apps on .NET Aspire

![Counter API-Code Coverage](https://img.shields.io/badge/Code%20Coverage-73%25-yellow?style=flat)

## Prerequisites

- [VS Code](https://code.visualstudio.com/)
    - [VS Code Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- [Docker Desktop](https://www.docker.com/products/docker-desktop) / [PodMan Desktop](https://podman-desktop.io/)

## Get starting

```sh
> task build
> task run
# http://localhost:5019
```

## Generate manifest file (powershell)

```sh
dotnet run --project app-host/CoffeeShop.AppHost.csproj \
    -- \
    --publisher manifest \
    --output-path ../aspire-manifest.json
```

## Deploy to Kubernetes

```sh
# Create K3d Kubernetes cluster
task cluster-create
```

```sh
dotnet tool install -g aspirate --prerelease
```

```sh
dotnet publish "/workspaces/coffeeshop-aspire/app-host/../product-api/CoffeeShop.ProductApi.csproj" -p:PublishProfile="DefaultContainer" -p:PublishSingleFile="true" 
-p:PublishTrimmed="false" --self-contained "true" --verbosity "quiet" --nologo -r "linux-x64" -p:ContainerRegistry="k3d-myregistry.localhost:12345" -p:ContainerRepository="product-api" -p:ContainerImageTag="latest"
```
