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

# dotnet version
dotnet --version

# dotnet workload list
dotnet workload list

# -----------------------------------------------------------------------------

# Final message
echo "Completed post-create.sh"
