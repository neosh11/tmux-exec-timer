#!/bin/bash

# src/timer.sh

source "$(dirname "$0")/utils.sh"

# Variables to store timing information
CURRENT_START_TIME=0
LAST_DURATION=0

# Function to start timing
start_timer() {
    CURRENT_START_TIME=$(date +%s)
    log_message "Timer started at $CURRENT_START_TIME"
}

# Function to stop timing and calculate duration
stop_timer() {
    if [ "$CURRENT_START_TIME" -ne 0 ]; then
        local end_time=$(date +%s)
        LAST_DURATION=$((end_time - CURRENT_START_TIME))
        log_message "Timer stopped at $end_time, duration: $LAST_DURATION seconds"
        CURRENT_START_TIME=0
    else
        log_message "Timer was not running."
    fi
}

# Function to get current duration
get_current_duration() {
    if [ "$CURRENT_START_TIME" -ne 0 ]; then
        local now=$(date +%s)
        echo $((now - CURRENT_START_TIME))
    else
        echo "0"
    fi
}

# Function to get last duration
get_last_duration() {
    echo "$LAST_DURATION"
}
