# tmux-exec-timer

A tmux plugin to track how long a process has been running in the current view or how long the last process took.

## Features

- **Track Current Process Duration**: Displays the elapsed time for the ongoing process.
- **Last Process Duration**: Shows how long the last executed process took to complete.
- **Customizable Display**: Configure where and how the timer is displayed within tmux.

## Installation

Using [TPM](https://github.com/tmux-plugins/tpm):

1. Add the plugin to TPM's list in your `.tmux.conf`:

   ```tmux
   set -g @plugin 'neosh11/tmux-exec-timer'
   ```