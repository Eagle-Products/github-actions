#!/usr/bin/env bash

if [ -f ".tflint_alt.hcl" ]; then
	export TFLINT_CONFIG=".tflint_alt.hcl"
elif [ -z "${TFLINT_CONFIG}" ]; then
	export TFLINT_CONFIG=".tflint.hcl"
fi

echo "==> Checking that code complies with tflint requirements..."
tflint --init --config=$TFLINT_CONFIG
error=false
tflint --config=$TFLINT_CONFIG --chdir=$(pwd)/ || error=true
if ${error}; then
  echo "------------------------------------------------"
  echo ""
  echo "The preceding files contain terraform blocks that does not complies with tflint requirements."
  echo ""
  exit 1
fi
