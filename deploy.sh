#!/bin/bash

BRANCH=$(git branch --show-current)

if [ "$1" == "staging" ]; then
  if [ "$BRANCH" != "khushi-dev" ]; then
    echo "❌ Staging deploys only allowed from khushi-dev branch."
    echo "   Current branch: $BRANCH"
    exit 1
  fi
  echo "🚀 Uploading to STAGING..."
  hs cms upload . my-dummy-theme --account=jeaviostaging

elif [ "$1" == "production" ]; then
  if [ "$BRANCH" != "main" ]; then
    echo "❌ Production deploys only allowed from main branch."
    echo "   Current branch: $BRANCH"
    exit 1
  fi
  echo "🚀 Uploading to PRODUCTION..."
  hs cms upload . my-dummy-theme --account=jeavioprod

else
  echo "Usage: ./deploy.sh [staging|production]"
fi