#!/bin/bash

# Check if a commit message is provided as an argument
if [ $# -eq 0 ]; then
    echo "masukan commit dulu"
    exit 1
fi

# Add all changes to the staging area
git add .

# Commit changes with the provided message
git commit -m "$1"

# Push changes to the remote repository
git push
