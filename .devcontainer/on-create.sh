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

# Create and install dotnet dev certificates
dotnet dev-certs https --trust

# -----------------------------------------------------------------------------

# Download file Taskfile completions for ZSH and BASH
mkdir -p ~/.oh-my-zsh/completions/
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

# Add linkerd path to environment variables using ~/.zshrc file
cat <<EOF >> ~/.zshrc

# Add Linkerd path to environment variables
export PATH=\$PATH:~/.linkerd2/bin

EOF

# Add linkerd path to environment variables using ~/.bashrc file
cat <<EOF >> ~/.bashrc

# Add Linkerd path to environment variables
export PATH=\$PATH:~/.linkerd2/bin

EOF

# -----------------------------------------------------------------------------

# Final message
echo "Completed on-create.sh"
