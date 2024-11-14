#!/bin/bash

# src/index.sh

source "$(dirname "$0")/utils.sh"
source "$(dirname "$0")/timer.sh"

# Initialize log
initialize_log

# Function to handle pane focus in
on_pane_focus_in() {
    stop_timer
    start_timer
    update_status_bar "$(get_current_duration)s" "${LAST_DURATION}s"
}

# Function to handle pane focus out
on_pane_focus_out() {
    stop_timer
    update_status_bar "0s" "${LAST_DURATION}s"
}

# Setup tmux hooks
setup_hooks() {
    # Register pane focus in hook
    tmux set-hook -g pane-focus-in "run-shell '~/.tmux/plugins/tmux-process-timer/src/index.sh pane_focus_in'"
    
    # Register pane focus out hook
    tmux set-hook -g pane-focus-out "run-shell '~/.tmux/plugins/tmux-process-timer/src/index.sh pane_focus_out'"
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
