#!/bin/bash

# Stop on errors
set -e

# # For Debugging: Print commands as they are being executed
# set -x

# -----------------------------------------------------------------------------

# Install Git version control system
apt-get update && apt-get install -y git bash bash-completion

# -----------------------------------------------------------------------------

# Download file Taskfile completions for ZSH and BASH
curl https://raw.githubusercontent.com/go-task/task/main/completion/zsh/_task  -o ~/.oh-my-zsh/completions/_task
curl https://raw.githubusercontent.com/go-task/task/main/completion/bash/task.bash -o ~/task.bash

# Add Taskfile Bash Completion to `completion_script`
cat <<EOF >> ~/.bashrc

# Enable bash auto-completion feature
source /etc/bash_completion

# Add Taskfile bash auto-completion
source ~/task.bash

EOF

# -----------------------------------------------------------------------------

# Add dotnet tool path to environment variables using ~/.zshrc file
cat <<EOF >> ~/.zshrc

# Add .NET Core SDK tools
export PATH="\$PATH:/root/.dotnet/tools"

EOF

# -----------------------------------------------------------------------------

# Add linkerd path to environment variables using ~/.zshrc file
cat <<EOF >> ~/.zshrc

# Add Linkerd path to environment variables
export PATH=\$PATH:/root/.linkerd2/bin

EOF

# -----------------------------------------------------------------------------

# Final message
echo "Completed environment-setup/install.sh"
