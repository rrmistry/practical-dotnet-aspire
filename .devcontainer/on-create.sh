#!/usr/bin/bash

# Stop on errors
set -e

# # For Debugging: Print commands as they are being executed
# set -x

# -----------------------------------------------------------------------------

# Create and install dotnet dev certificates
dotnet dev-certs https --trust

# -----------------------------------------------------------------------------

# Final message
echo "Completed on-create.sh"
