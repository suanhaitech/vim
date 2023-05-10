#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 /path/to/your/repos"
    exit 1
fi

root_path="$1"  # 你的仓库的根目录

repos=$(find "$root_path" -name ".git" -type d | sed 's/\/.git//')

for repo in $repos; do
  echo "$repo"
  cd "$repo"
  git_url=$(git remote get-url origin)
  if [[ $git_url == https://github.com/* ]]; then
    git_user_repo=${git_url#*github.com/}
    new_url="git@github.com:${git_user_repo}"
    git remote set-url origin "$new_url"
    echo "Updated repo: $repo"
  fi
  cd -
done

