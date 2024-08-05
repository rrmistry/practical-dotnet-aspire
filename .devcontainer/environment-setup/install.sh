#!/usr/bin/env bash

# Check if dos2unix exists and run it only if it does
if command -v dos2unix >/dev/null 2>&1; then
    dos2unix "$0" 2>/dev/null || true
fi

# Stop on errors
set -e

# # For Debugging: Print commands as they are being executed
# set -x

# -----------------------------------------------------------------------------

# Install Kubernetes tools

# Install k3d
curl -fsSL https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

# Install k9s
curl -fsSL https://webi.sh/k9s | bash

# Install Tilt
curl -fsSL https://raw.githubusercontent.com/tilt-dev/tilt/master/scripts/install.sh | bash

# Install Knative CLI
curl -fsSL https://github.com/knative/client/releases/download/knative-v1.9.0/kn-linux-amd64 -o kn
chmod +x kn
sudo mv kn /usr/local/bin/

# -----------------------------------------------------------------------------

# Install go-task
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin

# -----------------------------------------------------------------------------

# Install Linkerd
curl -fsSL https://run.linkerd.io/install | bash

# -----------------------------------------------------------------------------

# Install Aspire
dotnet workload install aspire

# Install Aspirate
dotnet tool install --global aspirate

# Install dotnet-script
dotnet tool install --global dotnet-script

# Install dotnet-repl
dotnet tool install --global dotnet-repl

# Add dotnet tools path to environment variables using ~/.zshrc file
cat <<EOF >> ~/.zshrc

# Add .NET Core SDK tools
export PATH="\$PATH:~/.dotnet/tools"

EOF

cat <<EOF >> ~/.bashrc

# Add .NET Core SDK tools
export PATH="\$PATH:~/.dotnet/tools"

EOF

# -----------------------------------------------------------------------------

# Final message
echo "Completed environment-setup/install.sh"
