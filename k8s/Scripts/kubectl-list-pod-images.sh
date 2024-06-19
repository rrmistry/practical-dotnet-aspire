#!/bin/bash

set -e
trap "exit 1" INT

pid=$$
process_name=$(ps -p $pid -o comm=)

echo "Process name: $process_name"
echo "Process ID: $pid"

imagesListFile="images.list"

# Extract images (including init containers), handling potential extra spaces
kubectl get pods --all-namespaces -o jsonpath='{range .items[*]}{.spec.containers[*].image}{" "}{.spec.initContainers[*].image}{" "}{end}' | \
    # Split into lines and remove empty lines (resulting from extra spaces)
    tr ' ' '\n' | grep -v '^$' | \
    grep -v "yatra-cloud:5000" | \
    sort -u > "$imagesListFile"
