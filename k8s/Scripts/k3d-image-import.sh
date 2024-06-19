#!/bin/bash

# Stop the script on error
set -e

# Print the commands being executed
# set -x

# Stop the script on interrupt
trap "exit 1" INT

# Get image list from file
while IFS= read -r image_tag; do
    # Skip empty lines
    [[ -z "$image_tag" ]] && continue

    echo "Processing $image_tag"

    # Check if the image exists locally
    if ! docker image inspect "$image_tag" > /dev/null 2>&1; then
        echo "Image $image_tag not found locally. Attempting to pull from remote repository..."
        if docker pull "$image_tag"; then
            echo "Successfully pulled $image_tag"
        else
            echo "Failed to pull $image_tag. Stopping..."
            break
        fi
    fi

    # Import this image into the k3d cluster (one at a time)
    echo "Importing images into k3d cluster 'yatra-cloud'"
    k3d image import --cluster "yatra-cloud" --mode "direct" $image_tag
done < ./images.list

# # Import all the images into the k3d cluster (once step but very slow and resource intensive)
# echo "Importing images into k3d cluster 'yatra-cloud'"
# k3d image import --cluster "yatra-cloud" --mode "direct" "${known_image_tags[@]}" --trace


# # List all local Docker images with their tags
# docker images --format "{{.Repository}}:{{.Tag}}" | while read -r image_tag; do
#     # Exclude images with tags starting with "vsc-" or "localhost"
#     if [[ $image_tag =~ ^vsc- ]] || [[ $image_tag =~ ^localhost ]]; then
#         continue
#     fi

#     # Check if the image tag is <none>, which indicates an untagged image
#     if [ "$image_tag" == "<none>:<none>" ]; then
#         continue
#     fi

#     # # Check if the image tag is <none>, which indicates an untagged image
#     # if [[ "$image_tag" != "neo4j:5.6.0" ]]; then
#     #     continue
#     # fi

#     # Run the k3d image import command for each tagged image
#     echo "Importing $image_tag into k3d cluster 'yatra-cloud'"
#     k3d image import --cluster "yatra-cloud" "$image_tag"
# done

