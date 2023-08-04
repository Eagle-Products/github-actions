#!/bin/bash
export BRANCH=${1:-dev}
export GITHUB_REPO="https://github.com/Eagle-Products/github-actions.git"
if [ -d "github-actions" ]; then
  echo "Removing existing scaffold"
  rm -rf "github-actions"
  rm -rf "scripts"
fi
echo "Cloning github-actions"
git clone -q -c advice.detachedHead=false --depth=1 -b $BRANCH $GITHUB_REPO
ln -s github-actions/scripts scripts
cp -r github-actions/.tflint.hcl .tflint.hcl
cp -r github-actions/.tflint_example.hcl .tflint_example.hcl

# rm -rf .devcontainer
# mkdir -p .devcontainer
# cp github-actions/devcontainer/devcontainer.json .devcontainer/devcontainer.json