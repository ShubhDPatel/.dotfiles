#!/bin/bash

echo "=== Quick Command Menu ==="
echo "1) Update system (Debian/Ubuntu)"
echo "2) Sync Git repo with remote (including pruning deleted branches)"
echo "3) Exit"

read -p "Choose an option (1-3): " choice

case "$choice" in
  1)
    echo "Running: sudo apt update && sudo apt upgrade -y"
    sudo apt update && sudo apt upgrade -y
    ;;
  2)
    echo "Syncing with remote and pruning deleted branches..."

    echo "Fetching all branches..."
    git fetch --all --prune

    echo "Pruning local branches deleted from remote..."
    for branch in $(git branch -vv | awk '/: gone]/{print $1}'); do
      echo "Deleting local branch: $branch"
      git branch -D "$branch"
    done

    echo "Done syncing."
    ;;
  3)
    echo "Goodbye!"
    ;;
  *)
    echo "Invalid choice. Exiting."
    ;;
esac
