#!/bin/sh

# Check for GitHub CLI command.
if ! command -v gh > /dev/null 2>&1; then
    echo "gh could not be found" 1>&2
    exit 1
fi

# Remove repository if it exists.
gh repo delete --yes workshop-github

# Remove upstream if it exists.
git remote rm upstream
