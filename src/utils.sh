#!/bin/bash

# src/utils.sh

# Function to set a tmux option
set_tmux_option() {
    local option="$1"
    local value="$2"
    tmux set-option -g "@$option" "$value"
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
    tmux set-option -g status-right "Process: ${current_duration} | Last: ${last_duration} | #[fg=green]#(tmux display-message -p '#S')#[default]"
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
}
