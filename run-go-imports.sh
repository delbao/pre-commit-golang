#!/bin/bash
#
# Capture and print stdout/stderr, since golint doesn't use proper exit codes
set -e

exec 5>&1
for file in "$@"; do
    output="$(goimports -w "$file" 2>&1 | tee /dev/fd/5)"
    [[ -z "$output" ]]
done

# @copyright del bao 

