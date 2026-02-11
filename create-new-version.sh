#!/bin/bash
# Script to create a new version of the Rockridge Slow Neighborhood site

set -e

if [ -z "$1" ]; then
    echo "Usage: ./create-new-version.sh <version-name>"
    echo "Example: ./create-new-version.sh v2"
    exit 1
fi

VERSION=$1
CURRENT_DIR=$(pwd)
PARENT_DIR=$(dirname "$CURRENT_DIR")
NEW_REPO_NAME="rockridge-slow-neighborhood-${VERSION}"
NEW_REPO_DIR="${PARENT_DIR}/${NEW_REPO_NAME}"

echo "Creating new version: ${VERSION}"
echo "New repository will be: ${NEW_REPO_NAME}"
echo ""

# Check if directory already exists
if [ -d "$NEW_REPO_DIR" ]; then
    echo "Error: Directory ${NEW_REPO_DIR} already exists!"
    exit 1
fi

# Copy current repository
echo "Copying current repository..."
cp -r "$CURRENT_DIR" "$NEW_REPO_DIR"

# Remove .git directory to start fresh
echo "Initializing new git repository..."
cd "$NEW_REPO_DIR"
rm -rf .git

# Initialize new git repo
git init
git add .
git commit -m "Initial commit: ${VERSION}"

echo ""
echo "✅ New version created at: ${NEW_REPO_DIR}"
echo ""
echo "Next steps:"
echo "1. Create a new repository on GitHub named: ${NEW_REPO_NAME}"
echo "2. Run these commands:"
echo "   cd ${NEW_REPO_DIR}"
echo "   git remote add origin https://github.com/tscheinok/${NEW_REPO_NAME}.git"
echo "   git push -u origin master"
echo ""
echo "Or I can help you push it if you create the repo on GitHub first!"
