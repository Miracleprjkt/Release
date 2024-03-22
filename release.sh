#!/bin/bash

# Copy zip here
run gh auth login once
gh auth login
filename=$(ls *.zip)

# Create a tag and release using the filename (without .zip extension)
version=${filename%.zip}

git tag -a "$version" -m "$version"

git push origin "$version"

gh release create "$version" "$filename" -t "$version" -n "Release notes"

