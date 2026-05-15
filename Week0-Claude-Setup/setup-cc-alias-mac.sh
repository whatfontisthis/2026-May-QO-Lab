#!/bin/bash
# Mac/Linux Setup Script for 'cc' alias
# This script adds 'cc' as an alias for 'claude --dangerously-skip-permissions'

# Determine which shell config file to use
if [[ "$SHELL" == *"zsh"* ]]; then
    CONFIG_FILE="$HOME/.zshrc"
    SHELL_NAME="zsh"
elif [[ "$SHELL" == *"bash"* ]]; then
    CONFIG_FILE="$HOME/.bash_profile"
    SHELL_NAME="bash"
else
    CONFIG_FILE="$HOME/.bashrc"
    SHELL_NAME="bash"
fi

# Add alias to the config file
ALIAS_LINE="alias cc='claude --dangerously-skip-permissions'"

if [ -f "$CONFIG_FILE" ]; then
    if grep -q "dangerously-skip-permissions" "$CONFIG_FILE"; then
        echo "'cc' alias already exists in $CONFIG_FILE"
    else
        echo "" >> "$CONFIG_FILE"
        echo "$ALIAS_LINE" >> "$CONFIG_FILE"
        echo "✓ Added 'cc' alias to $CONFIG_FILE"
    fi
else
    echo "$ALIAS_LINE" > "$CONFIG_FILE"
    echo "✓ Created $CONFIG_FILE with 'cc' alias"
fi

echo ""
echo "✓ Setup complete! You can now use 'cc' to run 'claude --dangerously-skip-permissions'"
echo "  Config file: $CONFIG_FILE"
echo ""
echo "To apply changes immediately, run: source $CONFIG_FILE"
