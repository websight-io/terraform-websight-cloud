#!/bin/bash
# set -x
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
TF_ROOT="$SCRIPT_DIR"/../

for script in $(find "$TF_ROOT" -type f -name '*.tf' | sed -r 's|/[^/]+$||' |sort |uniq); do
  terraform-docs -c "$SCRIPT_DIR"/.terraform-docs.yml "$script"
done