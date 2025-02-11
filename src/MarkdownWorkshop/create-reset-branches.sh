#!/bin/sh

git checkout main
for branch in $(seq -f cdl-"%02g" 0 99); do
    git show-ref -q --heads "$branch"
    if test $? -eq 0; then
        git branch -f "$branch" main
    else
        git branch "$branch" main
    fi
    git push --force origin "$branch"
done
