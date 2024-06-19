#!/usr/bin/bash

# Download file https://raw.githubusercontent.com/go-task/task/main/completion/zsh/_task to ~/.oh-my-zsh/completions/_task
curl -o ~/.oh-my-zsh/completions/_task https://raw.githubusercontent.com/go-task/task/main/completion/zsh/_task

# Add dotnet tool path to environment variables using ~/.zshrc file
cat << \EOF >> ~/.zshrc
# Add .NET Core SDK tools
export PATH="$PATH:/root/.dotnet/tools"
EOF

# Create and install dotnet dev certificates
dotnet dev-certs https --trust

# Final message
echo "Completed on-create.sh"
