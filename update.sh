#!/bin/bash

# Update all dependencies
npm update

# Get a list of outdated dependencies
outdated=$(npm outdated --parseable --depth=0 | cut -d: -f2)

# Check if any dependencies need to be updated
if [ -z "$outdated" ]; then
  echo "All dependencies are up to date"
  exit 0
fi

# Update each dependency to its latest version
echo "Updating dependencies:"
for package in $outdated; do
  echo " - $package"
  npm install "$package@latest" --save
done

echo "All dependencies have been updated"
exit 0
