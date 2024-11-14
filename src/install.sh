#!/bin/bash

# install.sh

# Ensure TPM is installed
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "TPM not found. Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "TPM already installed."
fi

# Clone the tmux-process-timer plugin
if [ ! -d "$HOME/.tmux/plugins/tmux-process-timer" ]; then
    echo "Cloning tmux-process-timer..."
    git clone https://github.com/yourusername/tmux-process-timer.git ~/.tmux/plugins/tmux-process-timer
else
    echo "tmux-process-timer already cloned."
fi

# Add plugin to .tmux.conf if not already present
if ! grep -q "tmux-process-timer" ~/.tmux.conf; then
    echo "Adding tmux-process-timer to .tmux.conf..."
    echo "set -g @plugin 'yourusername/tmux-process-timer'" >> ~/.tmux.conf
    echo "set -g status-right '#(tmux-process-timer-update)'" >> ~/.tmux.conf
    echo "run '~/.tmux/plugins/tpm/tpm'" >> ~/.tmux.conf
else
    echo "tmux-process-timer already present in .tmux.conf."
fi

# Reload tmux environment
echo "Reloading tmux environment..."
tmux source ~/.tmux.conf

# Install the plugin via TPM
echo "Installing plugins via TPM..."
~/.tmux/plugins/tpm/bin/install_plugins

echo "Installation complete. Press prefix + I to install any new plugins."
