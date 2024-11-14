#!/bin/bash

# src/utils.sh

# Enable debugging
set -x

# Function to set a tmux option
set_tmux_option() {
    local option="$1"
    local value="$2"
    if ! tmux set-option -g "@$option" "$value"; then
        log_message "Error setting tmux option @$option to $value"
    else
        log_message "Set tmux option @$option to $value"
    fi
}

# Function to get a tmux option
get_tmux_option() {
    local option="$1"
    tmux show-option -gqv "@$option"
}

# Function to update the tmux status bar
update_status_bar() {
    local current_duration="$1"
    local last_duration="$2"
    if ! tmux set-option -g status-right "Process: ${current_duration}s | Last: ${last_duration}s | #[fg=green]#(tmux display-message -p '#S')#[default]"; then
        log_message "Error updating status bar."
    else
        log_message "Status bar updated with Process: ${current_duration}s | Last: ${last_duration}s"
    fi
}

# Function to log messages (optional)
log_message() {
    local message="$1"
    echo "[tmux-process-timer] $message" >> "$TMUX_PROCESS_TIMER_LOG"
}

# Initialize log file
initialize_log() {
    TMUX_PROCESS_TIMER_LOG="${HOME}/.tmux_process_timer.log"
    touch "$TMUX_PROCESS_TIMER_LOG"
    echo "[tmux-process-timer] Log initialized at $(date)" >> "$TMUX_PROCESS_TIMER_LOG"
}
