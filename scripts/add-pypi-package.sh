#!/usr/bin/env bash
# Helper script to add PyPI packages using uv and update the lock file

set -e

if [ $# -eq 0 ]; then
    echo "Usage: $0 <package-name> [package-name2] ..."
    echo "Example: $0 requests numpy pandas"
    exit 1
fi

echo "Adding PyPI packages: $@"

# Add packages using uv
uv add "$@"

echo "Packages added successfully!"
echo "The uv.lock file has been updated automatically."
echo ""
echo "To use the updated environment:"
echo "1. Run 'nix develop .#uv-dev' to enter the development shell"
echo "2. Or rebuild the flake outputs with 'nix build .#artiq-uv2nix'"
