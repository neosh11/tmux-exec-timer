#!/bin/bash

# tests/test_timer.sh

source ../src/utils.sh
source ../src/timer.sh

echo "Running timer tests..."

start_timer
sleep 2
current_duration=$(get_current_duration)
stop_timer
last_duration=$(get_last_duration)

if [ "$current_duration" -ge 2 ] && [ "$last_duration" -ge 2 ]; then
    echo "Timer test passed."
else
    echo "Timer test failed."
    exit 1
fi
