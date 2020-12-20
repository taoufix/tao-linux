#!/bin/bash

_current_branch="$(git rev-parse --abbrev-ref HEAD)"

git stash &&
    git checkout _MAIN_ &&
    git pull &&
    git checkout "${_current_branch}" &&
    git stash pop
