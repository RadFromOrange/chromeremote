#!/bin/sh

# Manual script for installing Nix package manager on Debian x86_64

# Define variables
system="x86_64-linux"
hash="3c0779e4878d1289cf3fbb158ec5ea9bdf61dfb9b4efac6b3b0b6bec5ba4cf13"
url="https://releases.nixos.org/nix/nix-2.24.9/nix-2.24.9-$system.tar.xz"

# Create a temporary directory
tmpDir=$(mktemp -d -t nix-binary-tarball-unpack.XXXXXXXXXX)
cleanup() {
    rm -rf "$tmpDir"
}
trap cleanup EXIT INT QUIT TERM

# Check if required utilities are installed
require_util() {
    command -v "$1" > /dev/null 2>&1 || { echo "you do not have '$1' installed, which is required to $2"; exit 1; }
}

require_util curl "download the binary tarball"
require_util tar "unpack the binary tarball"
require_util xz "unpack the binary tarball"
require_util sha256sum "verify the tarball checksum"

# Download the binary tarball
tarball="$tmpDir/nix-2.24.9-$system.tar.xz"
echo "Downloading Nix 2.24.9 binary tarball for $system from '$url' to '$tmpDir'..."
curl --fail -L "$url" -o "$tarball" || { echo "Failed to download '$url'"; exit 1; }

# Verify the SHA-256 checksum
hash2=$(sha256sum -b "$tarball" | cut -c1-64)
if [ "$hash" != "$hash2" ]; then
    echo "SHA-256 hash mismatch: expected $hash, got $hash2"
    exit 1
fi
echo "SHA-256 checksum verified."

# Extract the tarball
unpack="$tmpDir/unpack"
mkdir -p "$unpack"
tar -xJf "$tarball" -C "$unpack" || { echo "Failed to unpack '$tarball'"; exit 1; }

# Run the installation script
script=$(echo "$unpack"/*/install)
[ -e "$script" ] || { echo "Installation script is missing from the binary tarball!"; exit 1; }
echo "Running the installation script..."
"$script"

echo "Nix installation complete."
