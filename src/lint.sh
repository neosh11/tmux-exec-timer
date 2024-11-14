#!/bin/bash

# scripts/lint.sh

echo "Running shellcheck..."

shell_files=$(find src/ scripts/ tests/ -type f -name "*.sh")

for file in $shell_files; do
    shellcheck "$file"
    if [ $? -ne 0 ]; then
        echo "Linting failed for $file."
        exit 1
    fi
done

echo "All shell scripts passed linting."
