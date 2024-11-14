#!/bin/bash

# tests/test_utils.sh

source ../src/utils.sh

echo "Running utils tests..."

initialize_log
log_message "Test log entry."

if grep -q "Test log entry." "$TMUX_PROCESS_TIMER_LOG"; then
    echo "Utils test passed."
else
    echo "Utils test failed."
    exit 1
fi
