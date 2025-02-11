#!/bin/sh

# Check for GitHub CLI command.
if ! command -v gh > /dev/null 2>&1; then
    echo "gh could not be found" 1>&2
    exit 1
fi

reset_branch_to_remote()
{
    if ! git rev-parse --verify "$1" > /dev/null 2>&1; then
        return
    fi
    git checkout "$1"
    git reset --hard "$2"/"$1"
}

clean_branch()
{
    git checkout "$1"
    git merge --abort > /dev/null 2>&1
    git rebase --abort > /dev/null 2>&1
    git cherry-pick --abort > /dev/null 2>&1
    git reset --hard HEAD
    git clean -d -f
}

# Add true-origin remote.
git remote rm true-origin
git remote add true-origin https://github.com/rosedu/workshop-github

# Abort any previous actions.
git merge --abort > /dev/null 2>&1
git rebase --abort > /dev/null 2>&1
git cherry-pick --abort > /dev/null 2>&1
git reset --hard HEAD

# Clean branches.
clean_branch test
clean_branch scripts
clean_branch base
clean_branch main

# Reset branches to true-origin remote.
git fetch true-origin
reset_branch_to_remote test true-origin
reset_branch_to_remote scripts true-origin
reset_branch_to_remote main true-origin

# Reset `main` branch in the `upstream` remote.
git push --force upstream main

# Close all pull requests.
repo_name=$(git remote show upstream | grep 'Fetch URL' | sed 's/\.git//' | rev | awk -F '[/:]' '{print $1"/"$2;}' | rev)
gh repo set-default "$repo_name"
for pr in $(gh pr list --json number | jq '.[] | values[]'); do
    gh pr close "$pr" -d
done
