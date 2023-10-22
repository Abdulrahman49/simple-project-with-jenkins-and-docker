#!/bin/bash
current_branch=$(git rev-parse --abbrev-ref HEAD)

if [[ $current_branch =~ release-([0-9]+) ]]; then
    current_release_number="${BASH_REMATCH[1]}"
    new_release_number=$((current_release_number + 1))
    new_branch="release-${new_release_number}"

    git checkout -b "$new_branch"
    git push origin "$new_branch"
else
    echo "Current branch does not follow the release naming convention."
