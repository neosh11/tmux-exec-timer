#!/bin/bash

# src/index.sh

source "$(dirname "$0")/utils.sh"
source "$(dirname "$0")/timer.sh"

# Initialize log
initialize_log

# Function to handle pane focus in
on_pane_focus_in() {
    log_message "Handling pane_focus_in event."
    stop_timer
    start_timer
    update_status_bar "$(get_current_duration)" "${LAST_DURATION}"
}

# Function to handle pane focus out
on_pane_focus_out() {
    log_message "Handling pane_focus_out event."
    stop_timer
    update_status_bar "0" "${LAST_DURATION}"
}

# Setup tmux hooks
setup_hooks() {
    PLUGIN_DIR="$HOME/.tmux/plugins/tmux-process-timer"

    # Register pane focus in hook
    tmux set-hook -g pane-focus-in "run-shell '$PLUGIN_DIR/src/index.sh pane_focus_in'"

    # Register pane focus out hook
    tmux set-hook -g pane-focus-out "run-shell '$PLUGIN_DIR/src/index.sh pane_focus_out'"

    log_message "tmux hooks set for pane-focus-in and pane-focus-out."
}

# Handler for pane focus in
pane_focus_in() {
    on_pane_focus_in
}

# Handler for pane focus out
pane_focus_out() {
    on_pane_focus_out
}

# Main entry point
main() {
    case "$1" in
        pane_focus_in)
            pane_focus_in
            ;;
        pane_focus_out)
            pane_focus_out
            ;;
        *)
            setup_hooks
            ;;
    esac
}

main "$@"
