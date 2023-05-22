#!/bin/bash
REPOSITORIES=$(curl -s https://api.github.com/users/webmalc/repos?per_page=1000 | jq -r '.[] | select(.fork == false).clone_url')
MB_REPOSITORIES=("git@github.com:maxi-booking/d8base-frontend.git" "git@github.com:maxi-booking/d8base-backend.git")
WEBMALC_DIR=/home/webmalc/Backup/github/webmalc
MB_DIR=/home/webmalc/Backup/github/mb

rm -rf $WEBMALC_DIR
rm -rf $MB_DIR
mkdir -p $WEBMALC_DIR
mkdir -p $MB_DIR

cd $WEBMALC_DIR
for REPOSITORY in $REPOSITORIES; do
  git clone $REPOSITORY
done

cd $MB_DIR
for REPOSITORY in "${MB_REPOSITORIES[@]}"; do
  git clone $REPOSITORY
done