#!/usr/bin/bash

# Stop on errors
set -e

# # For Debugging: Print commands as they are being executed
# set -x

# -----------------------------------------------------------------------------

## dotnet
dotnet restore

# -----------------------------------------------------------------------------

# Final message
echo "Completed post-create.sh"
