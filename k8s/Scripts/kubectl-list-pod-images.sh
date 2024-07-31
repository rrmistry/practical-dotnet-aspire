#!/bin/bash

set -e
trap "exit 1" INT

imagesListFile="images.list"

# Extract images (including init containers), handling potential extra spaces
kubectl get pods --all-namespaces -o jsonpath='{range .items[*]}{.spec.containers[*].image}{" "}{.spec.initContainers[*].image}{" "}{end}' | \
    # Split into lines and remove empty lines (resulting from extra spaces)
    tr ' ' '\n' | grep -v '^$' | \
    grep -v "aspire-cluster:5000" | \
    sort -u > "$imagesListFile"

# Add any additional images to the list
echo "mcr.microsoft.com/devcontainers/base:latest" >> "$imagesListFile"
