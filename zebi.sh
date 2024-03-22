#!/bin/bash

# Create temporary directory
temp_dir=$(mktemp -d)

# Download the package and its dependencies into the temporary directory
apt-get download --allow-unauthenticated --allow-downgrades --allow-remove-essential --allow-change-held-packages -o Dir::Cache::archives="$temp_dir" "$1"

# Install the package and its dependencies into the specified directory
dpkg -i --root="/tmp/ggg" "$temp_dir"/*.deb

# Clean up temporary directory
rm -rf "$temp_dir"
