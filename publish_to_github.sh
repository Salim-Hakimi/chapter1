#!/usr/bin/env bash
set -euo pipefail

REPO="Salim-Hakimi/chapter1"
REMOTE_URL="https://github.com/${REPO}.git"

if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) is not installed. Install it first: https://cli.github.com/"
  exit 1
fi
if ! command -v git >/dev/null 2>&1; then
  echo "Git is not installed. Install it first with: sudo apt install git"
  exit 1
fi

gh auth status

if [ ! -d .git ]; then
  git init -b main
fi

git add .
if ! git diff --cached --quiet; then
  git commit -m "Add StatefulWidget lifecycle demo"
else
  echo "No new changes to commit."
fi

if gh repo view "$REPO" >/dev/null 2>&1; then
  echo "Repository already exists: https://github.com/${REPO}"
  if git remote get-url origin >/dev/null 2>&1; then
    git remote set-url origin "$REMOTE_URL"
  else
    git remote add origin "$REMOTE_URL"
  fi
  git push -u origin main
else
  echo "Creating public repository ${REPO} and pushing the project..."
  gh repo create chapter1 --public --source=. --remote=origin --push
fi

echo "Done. Repository: https://github.com/${REPO}"
