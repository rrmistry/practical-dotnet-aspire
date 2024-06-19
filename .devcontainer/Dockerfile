FROM mcr.microsoft.com/dotnet/sdk:8.0-jammy

# Install sudo command for script compatibility
RUN apt-get update && apt-get install -y sudo

# Install Aspire
RUN dotnet workload install aspire \
 && dotnet tool install --global aspirate --prerelease

# Install k3d
RUN curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# Install k9s
RUN curl -sS https://webi.sh/k9s | sh

# Install Tilt
RUN curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash

# Install go-task
RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin
